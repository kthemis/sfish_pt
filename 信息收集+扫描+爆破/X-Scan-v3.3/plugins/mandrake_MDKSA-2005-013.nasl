
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(16241);
 script_version ("$Revision: 1.5 $");
 script_name(english: "MDKSA-2005:013: ethereal");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2005:013 (ethereal).");
 script_set_attribute(attribute: "description", value: "A number of vulnerabilities were found in Ethereal, all of which are
fixed in version 0.10.9: The COPS dissector could go into an infinite
loop (CVE-2005-0006); the DLSw dissector could cause an assertion,
making Ethereal exit prematurely (CVE-2005-0007); the DNP dissector
could cause memory corruption (CVE-2005-0008); the Gnutella dissector
could cause an assertion, making Ethereal exit prematurely
(CVE-2005-0009); the MMSE dissector could free static memory
(CVE-2005-0010); and the X11 protocol dissector is vulnerable to a
string buffer overflow (CVE-2005-0084).
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:013");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-0006", "CVE-2005-0007", "CVE-2005-0008", "CVE-2005-0009", "CVE-2005-0010", "CVE-2005-0084");
script_summary(english: "Check for the version of the ethereal package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"ethereal-0.10.9-0.1.100mdk", release:"MDK10.0", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"ethereal-0.10.9-0.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"ethereal-tools-0.10.9-0.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libethereal0-0.10.9-0.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"tethereal-0.10.9-0.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"ethereal-", release:"MDK10.0")
 || rpm_exists(rpm:"ethereal-", release:"MDK10.1") )
{
 set_kb_item(name:"CVE-2005-0006", value:TRUE);
 set_kb_item(name:"CVE-2005-0007", value:TRUE);
 set_kb_item(name:"CVE-2005-0008", value:TRUE);
 set_kb_item(name:"CVE-2005-0009", value:TRUE);
 set_kb_item(name:"CVE-2005-0010", value:TRUE);
 set_kb_item(name:"CVE-2005-0084", value:TRUE);
}
exit(0, "Host is not affected");
