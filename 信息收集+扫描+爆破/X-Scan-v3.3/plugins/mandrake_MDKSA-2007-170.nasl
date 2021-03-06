
#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory ADVISORY
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(25947);
 script_version ("$Revision: 1.3 $");
 script_name(english: "MDKSA-2007:170: gimp");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory MDKSA-2007:170 (gimp).");
 script_set_attribute(attribute: "description", value: "Multiple integer overflows in the image loader plug-ins in GIMP before
2.2.16 allow user-assisted remote attackers to execute arbitrary code
via crafted length values in (1) DICOM, (2) PNM, (3) PSD, (4) PSP,
(5) Sun RAS, (6) XBM, and (7) XWD files. (CVE-2006-4519)
Integer overflow in the seek_to_and_unpack_pixeldata function in
the psd.c plugin in Gimp 2.2.15 allows remote attackers to execute
arbitrary code via a crafted PSD file that contains a large (1)
width or (2) height value. (CVE-2007-2949)
Victor Stinner has discovered several flaws in file plug-ins using
his fuzzyfier tool fusil. Several modified image files cause the
plug-ins to crash or consume excessive amounts of memory due to
insufficient input validation. Affected plug-ins: bmp, pcx, psd, psp
(*.tub). (CVE-2007-3741)
Updated packages have been patched to prevent these issues.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2007:170");
script_set_attribute(attribute: "solution", value: "Apply the newest security patches from Mandriva.");
script_end_attributes();

script_cve_id("CVE-2006-4519", "CVE-2007-2949", "CVE-2007-3741");
script_summary(english: "Check for the version of the gimp package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Mandriva Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/Mandrake/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"gimp-2.3.10-6.4mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"gimp-python-2.3.10-6.4mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libgimp2.0-devel-2.3.10-6.4mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libgimp2.0_0-2.3.10-6.4mdv2007.0", release:"MDK2007.0", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"gimp-2.3.14-3.3mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"gimp-python-2.3.14-3.3mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libgimp2.0-devel-2.3.14-3.3mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"libgimp2.0_0-2.3.14-3.3mdv2007.1", release:"MDK2007.1", yank:"mdv") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
if (rpm_exists(rpm:"gimp-", release:"MDK2007.0")
 || rpm_exists(rpm:"gimp-", release:"MDK2007.1") )
{
 set_kb_item(name:"CVE-2006-4519", value:TRUE);
 set_kb_item(name:"CVE-2007-2949", value:TRUE);
 set_kb_item(name:"CVE-2007-3741", value:TRUE);
}
exit(0, "Host is not affected");
