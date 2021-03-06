
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(19991);
 script_version ("$Revision: 1.6 $");
 script_name(english: "RHSA-2005-673: binutils");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2005-673");
 script_set_attribute(attribute: "description", value: '
  An updated binutils package that fixes several bugs and minor security
  issues is now available.

  This update has been rated as having low security impact by the Red Hat
  Security Response Team.

  Binutils is a collection of utilities used for the creation of executable
  code. A number of bugs were found in various binutils tools.

  If a user is tricked into processing a specially crafted executable with
  utilities such as readelf, size, strings, objdump, or nm, it may allow the
  execution of arbitrary code as the user. The Common Vulnerabilities and
  Exposures project (cve.mitre.org) has assigned the name CAN-2005-1704 to
  this issue.

  In addition, the following bugs have been fixed:

  -- by default issue an error if IA-64 hint@pause instruction is
  put into the B slot, add assembler command line switch to
  override this behaviour
  -- fix linker\'s --emit-relocs with .gnu.warning.* section symbols
  -- fix gprof on 64-bit ppc binaries and libraries
  -- fix gas mapping of register names to dwarf2 register numbers
  in CFI directives

  All users of binutils should upgrade to this updated package, which
  contains patches to resolve these issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2005-673.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2005-1704");
script_summary(english: "Check for the version of the binutils packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"binutils-2.15.92.0.2-15", release:'RHEL4') )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
