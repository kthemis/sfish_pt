# This script was automatically generated from the dsa-1257
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(24296);
 script_version("$Revision: 1.5 $");
 script_xref(name: "DSA", value: "1257");
 script_cve_id("CVE-2007-0452", "CVE-2007-0454");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1257 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in samba, a free
implementation of the SMB/CIFS protocol, which may lead to the execution
of arbitrary code or denial of service. The Common Vulnerabilities and
Exposures project identifies the following problems:
CVE-2007-0452
    It was discovered that incorrect handling of deferred file open calls
    may lead to an infinite loop, which results in denial of service.
CVE-2007-0454
    "zybadawg333" discovered that the AFS ACL mapping VFS plugin performs
    insecure format string handling, which may lead to the execution of
    arbitrary code.
For the stable distribution (sarge) these problems have been fixed in
version 3.0.14a-3sarge4.
For the upcoming stable distribution (etch) these problems have been
fixed in version 3.0.23d-5.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1257');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your samba package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1257] DSA-1257-1 samba");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1257-1 samba");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'libpam-smbpass', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'libsmbclient', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'libsmbclient-dev', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'python2.3-samba', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'samba', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'samba-common', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'samba-dbg', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'samba-doc', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'smbclient', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'smbfs', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'swat', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'winbind', release: '3.1', reference: '3.0.14a-3sarge4');
deb_check(prefix: 'samba', release: '4.0', reference: '3.0.23d-5');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
