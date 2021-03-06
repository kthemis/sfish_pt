# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200612-10.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(23862);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200612-10");
 script_cve_id("CVE-2006-6097");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200612-10 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200612-10
(Tar: Directory traversal vulnerability)


    Tar does not properly extract archive elements using the GNUTYPE_NAMES
    record name, allowing files to be created at arbitrary locations using
    symlinks. Once a symlink is extracted, files after the symlink in the
    archive will be extracted to the destination of the symlink.
  
Impact

    An attacker could entice a user to extract a specially crafted tar
    archive, possibly allowing for the overwriting of arbitrary files on
    the system extracting the archive.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Tar users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=app-arch/tar-1.16-r2"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:N/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6097');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200612-10.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200612-10] Tar: Directory traversal vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Tar: Directory traversal vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "app-arch/tar", unaffected: make_list("ge 1.16-r2"), vulnerable: make_list("lt 1.16-r2")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
