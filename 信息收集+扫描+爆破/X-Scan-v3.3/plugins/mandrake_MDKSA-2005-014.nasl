
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(16242);
 script_version ("$Revision: 1.5 $");
 script_name(english: "MDKSA-2005:014: squid");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2005:014 (squid).");
 script_set_attribute(attribute: "description", value: "'infamous41md' discovered two vulnerabilities in the squid proxy
cache server. The first is a buffer overflow in the Gopher response
parser which leads to memory corruption and would usually crash squid
(CVE-2005-0094). The second is an integer overflow in the receiver of
WCCP (Web Cache Communication Protocol) messages. An attacker could
send a specially crafted UDP datagram that would cause squid to crash
(CVE-2005-0095).
The updated packages have been patched to prevent these problems.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:014");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2005-0094", "CVE-2005-0095");
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

if ( rpm_check( reference:"squid-2.5.STABLE4-2.3.100mdk", release:"MDK10.0", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"squid-2.5.STABLE6-2.2.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"squid-2.5.STABLE3-3.5.92mdk", release:"MDK9.2", yank:"mdk") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"squid-", release:"MDK10.0")
 || rpm_exists(rpm:"squid-", release:"MDK10.1")
 || rpm_exists(rpm:"squid-", release:"MDK9.2") )
{
 set_kb_item(name:"CVE-2005-0094", value:TRUE);
 set_kb_item(name:"CVE-2005-0095", value:TRUE);
}
exit(0, "Host is not affected");
