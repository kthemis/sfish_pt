
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(20041);
 script_version ("$Revision: 1.5 $");
 script_name(english: "MDKSA-2005:181: squid");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2005:181 (squid).");
 script_set_attribute(attribute: "description", value: "Squid 2.5.9, while performing NTLM authentication, does not properly
handle certain request sequences, which allows attackers to cause a
denial of service (daemon restart).
The updated packages have been patched to address these issues.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:181");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-2917");
script_summary(english: "Check for the version of the squid package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"squid-2.5.STABLE9-1.4.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"squid-2.5.STABLE9-1.4.102mdk", release:"MDK10.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"squid-2.5.STABLE10-10.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"squid-cachemgr-2.5.STABLE10-10.1.20060mdk", release:"MDK2006.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"squid-", release:"MDK10.1")
 || rpm_exists(rpm:"squid-", release:"MDK10.2")
 || rpm_exists(rpm:"squid-", release:"MDK2006.0") )
{
 set_kb_item(name:"CVE-2005-2917", value:TRUE);
}
exit(0, "Host is not affected");
