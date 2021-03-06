#
# (C) Tenable Network Security, Inc.
#

# See:
# Date:  29 Dec 2001 18:53:39 -0000
# From: "antoan miroslavov" <shaltera@yahoo.com>
# To: bugtraq@securityfocus.com
# Subject: Active Perl path reveal
#


include("compat.inc");

if(description)
{
 script_id(10120);
 script_bugtraq_id(194);
 script_version ("$Revision: 1.30 $");
 script_cve_id("CVE-1999-0450");
 script_xref(name:"OSVDB", value:"98");
 script_name(english:"Microsoft IIS perl.exe HTTP Path Disclosure");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is affected by an information disclosure 
vulnerability." );
 script_set_attribute(attribute:"description", value:
"It was possible to obtain the physical location of a virtual web
directory of this host by issuing a request for a non-existent file
with an IISAPI-registered extension.

An attacker may use this flaw to gain more information about the remote
host, and hence make more focused attacks." );
 script_set_attribute(attribute:"solution", value:
"Configure the web server to check for the existence of a file before
it returns an error message." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 
 summary["english"] = "Attempts to find the location of the remote web root";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 
 script_copyright(english:"This script is Copyright (C) 1999-2009 Tenable Network Security, Inc.");
 family["english"] = "Web Servers";
 script_family(english:family["english"]);
 script_dependencie("find_service1.nasl", "httpver.nasl", "http_version.nasl", "www_fingerprinting_hmap.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

#
# The script code starts here
#

include("http.inc");
include("global_settings.inc");
include("misc_func.inc");

port = get_http_port(default:80);

banner = get_http_banner(port:port);
if ( "Microsoft-IIS" >!< banner ) exit(0);

res = http_send_recv3(method:"GET", item:"/scripts/no-such-file.pl", port:port);
if (isnull(res)) exit(1, "The remote web server did not respond.");

res[2] = tolower(res[2]);
if("perl script" >< res[2]) security_warning(port:port);
