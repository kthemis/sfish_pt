
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-2620
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(31667);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 7 2008-2620: asterisk");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-2620 (asterisk)");
 script_set_attribute(attribute: "description", value: "Asterisk is a complete PBX in software. It runs on Linux and provides
all of the features you would expect from a PBX and more. Asterisk
does voice over IP in three protocols, and can interoperate with
almost all standards-based telephony equipment using relatively
inexpensive hardware.

-
Update Information:

Update to 1.4.18.1 plus another patch to fix some security issues.
AST-2008-002 details two buffer overflows that were discovered in  RTP codec
payload type handling.  *
[9]http://downloads.digium.com/pub/security/AST-2008-002.pdf  * All users of SI
P in
Asterisk 1.4 and 1.6 are affected.    AST-2008-003 details a vulnerability whic
h
allows an attacker to  bypass SIP authentication and to make a call into the
context  specified in the general section of sip.conf.  *
[10]http://downloads.digium.com/pub/security/AST-2008-003.pdf  * All users of S
IP in
Asterisk 1.0, 1.2, 1.4, or 1.6 are affected.    AST-2008-005 details a problem
in the way manager IDs are caculated.  *
[11]http://downloads.digium.com/pub/security/AST-2008-005.pdf
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2008-1289", "CVE-2008-1332", "CVE-2008-1390");
script_summary(english: "Check for the version of the asterisk package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"asterisk-1.4.18.1-1.fc7", release:"FC7") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
