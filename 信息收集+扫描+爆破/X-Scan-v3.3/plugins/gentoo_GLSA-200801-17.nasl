# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200801-17.xml
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
 script_id(30242);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200801-17");
 script_cve_id("CVE-2007-6263");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200801-17 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200801-17
(Netkit FTP Server: Denial of Service)


    Venustech AD-LAB discovered that an FTP client connected to a
    vulnerable server with passive mode and SSL support can trigger an
    fclose() function call on an uninitialized stream in ftpd.c.
  
Impact

    A remote attacker can send specially crafted FTP data to a server with
    passive mode and SSL support, causing the ftpd daemon to crash.
  
Workaround

    Disable passive mode or SSL.
  
');
script_set_attribute(attribute:'solution', value: '
    All Netkit FTP Server users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=net-ftp/netkit-ftpd-0.17-r7"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-6263');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200801-17.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200801-17] Netkit FTP Server: Denial of Service');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Netkit FTP Server: Denial of Service');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-ftp/netkit-ftpd", unaffected: make_list("ge 0.17-r7"), vulnerable: make_list("lt 0.17-r7")
)) { security_hole(0); exit(0); }
exit(0, "Host is not affected");
