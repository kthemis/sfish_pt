# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200703-12.xml
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
 script_id(24829);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200703-12");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200703-12 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200703-12
(SILC Server: Denial of Service)


    Frank Benkstein discovered a possible NULL pointer dereference in
    apps/silcd/command.c if a new channel is created without specifying a
    valid hmac or cipher algorithm name.
  
Impact

    A remote attacker could cause the server to crash, resulting in a
    Denial of Service.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All SILC Server users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=net-im/silc-server-1.0.2-r1"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200703-12.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200703-12] SILC Server: Denial of Service');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'SILC Server: Denial of Service');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-im/silc-server", unaffected: make_list("ge 1.0.2-r1"), vulnerable: make_list("lt 1.0.2-r1")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
