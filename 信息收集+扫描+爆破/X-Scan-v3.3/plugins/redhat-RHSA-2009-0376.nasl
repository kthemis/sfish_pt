
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(40740);
 script_version ("$Revision: 1.2 $");
 script_name(english: "RHSA-2009-0376: acroread");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2009-0376");
 script_set_attribute(attribute: "description", value: '
  Updated acroread packages that fix multiple security issues are now
  available for Red Hat Enterprise Linux 3 Extras, Red Hat Enterprise Linux 4
  Extras, and Red Hat Enterprise Linux 5 Supplementary.

  This update has been rated as having critical security impact by the Red
  Hat Security Response Team.

  Adobe Reader allows users to view and print documents in Portable Document
  Format (PDF).

  Multiple input validation flaws were discovered in the JBIG2 compressed
  images decoder used by Adobe Reader. A malicious PDF file could cause Adobe
  Reader to crash or, potentially, execute arbitrary code as the user running
  Adobe Reader. (CVE-2009-0193, CVE-2009-0658, CVE-2009-0928, CVE-2009-1061,
  CVE-2009-1062)

  All Adobe Reader users should install these updated packages. They contain
  Adobe Reader version 8.1.4, which is not vulnerable to these issues. All
  running instances of Adobe Reader must be restarted for the update to take
  effect.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2009-0376.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2009-0193", "CVE-2009-0658", "CVE-2009-0928", "CVE-2009-1061", "CVE-2009-1062");
script_summary(english: "Check for the version of the acroread packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"acroread-8.1.4-1", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"acroread-plugin-8.1.4-1", release:'RHEL3') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"acroread-8.1.4-1.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"acroread-plugin-8.1.4-1.el4", release:'RHEL4') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"acroread-8.1.4-1.el4", release:'RHEL4.7.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"acroread-plugin-8.1.4-1.el4", release:'RHEL4.7.') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
