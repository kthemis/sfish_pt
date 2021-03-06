#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(27535);
  script_version("$Revision: 1.7 $");

  script_cve_id("CVE-2007-3510");
  script_bugtraq_id(26176);
  script_xref(name:"OSVDB", value:"40953");

  script_name(english:"IBM Lotus Domino IMAP Service Mailbox Name Overflow");
  script_summary(english:"Checks version of Domino IMAP Server");

 script_set_attribute(attribute:"synopsis", value:
"The remote IMAP server is affected by a buffer overflow vulnerability." );
 script_set_attribute(attribute:"description", value:
"The IMAP server component of IBM Lotus Domino Server installed on the
remote host fails to properly validate the mailbox name before copying
it into a fixed-size stack buffer as part of handling certain
unspecified commands.  Using a specially-crafted mailbox name to which
he is subscribed, an authenticated attacker can leverage this issue to
execute arbitrary code remotely. 

Note that successful exploitation typically results in SYSTEM-level
access under Windows and non-root access on unix-like systems." );
 script_set_attribute(attribute:"see_also", value:"http://labs.idefense.com/intelligence/vulnerabilities/display.php?id=605" );
 script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/482739/30/0/threaded" );
 script_set_attribute(attribute:"see_also", value:"http://www-1.ibm.com/support/docview.wss?uid=swg21270623" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to Domino 6.5.6 Fix Pack 2 / 7.0.3 / 8.0 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:S/C:C/I:C/A:C" );


script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Gain a shell remotely");
  script_copyright(english:"This script is Copyright (C) 2007-2009 Tenable Network Security, Inc.");
  script_dependencies("find_service1.nasl");
  script_require_ports("Services/imap", 143);

  exit(0);
}


include("imap_func.inc");


port = get_kb_item("Services/imap");
if (!port) port = 143;
if (!get_port_state(port)) exit(0);


# Do a banner check.
banner = get_imap_banner(port:port);
if (!banner || " Domino IMAP4 Server Release " >!< banner) exit(0);

ver = strstr(banner, "Server Release ") - "Server Release ";
ver = ver - strstr(ver, " ready");
# nb: IBM's advisory says versions 6.5 < 6.5.6FP2 and 7.0 < 7.0.3 are affected.
if (ver && egrep(pattern:"^(6\.5($|[^.]|\.([0-5]($|[^0-9])|6($|FP1)))|7\.0($|[^.]|\.[0-2]($|[^0-9])))", string:ver))
{
  report = string(
    "According to the banner from its IMAP server, Domino ", ver, " is\n",
    "installed on the remote host.\n"
  );
  security_hole(port:port, extra: report);
}
