
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(33251);
 script_version ("$Revision: 1.8 $");
 script_name(english: "SuSE Security Update:  Security update for gnome-screensaver (gnome-screensaver-5179)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch gnome-screensaver-5179");
 script_set_attribute(attribute: "description", value: "An attacker could log in without a valid password if the
NIS server is down. (CVE-2008-0887)
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:M/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch gnome-screensaver-5179");
script_end_attributes();

script_cve_id("CVE-2008-0887");
script_summary(english: "Check for the gnome-screensaver-5179 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"gnome-screensaver-2.14.0-19.41.8", release:"SLES10") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"gnome-screensaver-2.14.0-19.41.8", release:"SLED10") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
