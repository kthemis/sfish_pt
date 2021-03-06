#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if (description)
{
  script_id(21748);
  script_version("$Revision: 1.12 $");

  script_cve_id("CVE-2006-2310", "CVE-2006-2311");
  script_bugtraq_id(18623, 18624);
  script_xref(name:"OSVDB", value:"26788");
  script_xref(name:"OSVDB", value:"26789");

  script_name(english:"BlueDragon 6.2.1 Multiple Remote Vulnerabilities (XSS, DoS)");
  script_summary(english:"Checks for an XSS flaw in BlueDragon Server");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server is prone to denial of service and cross-site
scripting attacks." );
 script_set_attribute(attribute:"description", value:
"The remote host is running BlueDragon Server / Server JX, Java-based
servers for stand-alone deployment of CFML (ColdFusion Markup
Language) pages. 

The version of BlueDragon Server / Server JX installed on the remote
host fails to sanitize user-supplied input passed as part of the
filename before using it in a dynamically-generated error page.  An
unauthenticated attacker can exploit this issue to execute arbitrary
HTML and script code in a user's browser within the context of the
affected application. 

In addition, the server reportedly stops responding when it tries to
handle a request containing an MS-DOS device name with the '.cfm'
extension." );
 script_set_attribute(attribute:"see_also", value:"http://secunia.com/secunia_research/2006-18/advisory/" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P" );
script_end_attributes();

 
  script_category(ACT_ATTACK);
  script_family(english:"CGI abuses");
  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");
  script_dependencies("http_version.nasl", "cross_site_scripting.nasl");
  script_require_ports("Services/www", 8080);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");
include("http.inc");
include("url_func.inc");


port = get_http_port(default:8080);
if (get_kb_item("www/"+port+"/generic_xss")) exit(0);

# Make sure the banner looks like BlueDragon.
banner = get_http_banner(port:port);
if (!banner || "BlueDragon" >!< banner) exit(0);


# Try to exploit the flaw.
xss = string("<script>alert('", SCRIPT_NAME, "')</script>");
r = http_send_recv3(method:"GET", item:string("/", urlencode(str:xss), ".cfm"), port:port);
if (isnull(r)) exit(0);
# nb: keepalives seem to sometimes cause the script to fail.
res = strcat(r[0], r[1], '\r\n', r[2]);

# There's a problem if we see our XSS.
if (string("Request</TD><TD>/", xss) >< res)
{
 security_warning(port);
 set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
}
