
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2009-7729
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(39859);
 script_version ("$Revision: 1.2 $");
script_name(english: "Fedora 10 2009-7729: wordpress");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2009-7729 (wordpress)");
 script_set_attribute(attribute: "description", value: "Wordpress is an online publishing / weblog package that makes it very easy,
almost trivial, to get information out to people on the web.

-
ChangeLog:


Update information :

* Fri Jul 10 2009 Adrian Reber <adrian lisas de> - 2.8.1-1
- updated to 2.8.1 for security fixes - BZ 510745
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2009-2336");
script_summary(english: "Check for the version of the wordpress package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"wordpress-2.8.1-1.fc10", release:"FC10") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
