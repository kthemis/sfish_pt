# This script was automatically generated from the dsa-1143
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(22685);
 script_version("$Revision: 1.4 $");
 script_xref(name: "DSA", value: "1143");
 script_cve_id("CVE-2006-3122");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1143 security update');
 script_set_attribute(attribute: 'description', value:
'Justin Winschief and Andrew Steets discovered a bug in dhcp, the DHCP
server for automatic IP address assignment, which causes the server to
unexpectedly exit.
For the stable distribution (sarge) this problem has been fixed in
version 2.0pl5-19.1sarge2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2006/dsa-1143');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your dhcp package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1143] DSA-1143-1 dhcp");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1143-1 dhcp");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'dhcp', release: '3.1', reference: '2.0pl5-19.1sarge2');
deb_check(prefix: 'dhcp-client', release: '3.1', reference: '2.0pl5-19.1sarge2');
deb_check(prefix: 'dhcp-relay', release: '3.1', reference: '2.0pl5-19.1sarge2');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
