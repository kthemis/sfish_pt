
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-6166
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(39771);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 11 2009-6166: webkitgtk");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-6166 (webkitgtk)");
 script_set_attribute(attribute: "description", value: "WebKitGTK+ is the port of the portable web rendering engine WebKit to the
GTK+ platform.

-
Update Information:

WebKitGTK+ 1.1.8 contains many bug-fixes and updates including spell-checking
support, enhanced error reporting, lots of ATK enhancements, support for copyin
g
images to the clipboard, and a new printing API (since 1.1.5) that allows
applications better control and monitoring of the printing process.    Also, a
potential buffer overflow  in SVGList::insertItemBefore has been fixed
(CVE-2009-0945); and the JIT compiler is now enabled by default for x86_64
systems.    Please see the upstream changelog for the full list of fixes and
enhancements:    [9]http://svn.webkit.org/repository/webkit/trunk/WebKit/gtk/NE
WS
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2009-0945");
script_summary(english: "Check for the version of the webkitgtk package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"webkitgtk-1.1.8-1.fc11", release:"FC11") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
