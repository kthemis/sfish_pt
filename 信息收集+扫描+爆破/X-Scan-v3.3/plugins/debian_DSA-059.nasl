# This script was automatically generated from the dsa-059
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(14896);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "059");
 script_cve_id("CVE-2001-1331");
 script_bugtraq_id(2720, 2815);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-059 security update');
 script_set_attribute(attribute: 'description', value:
'Luki R. reported a bug in man-db: it did not handle nested calls of
drop_effective_privs() and regain_effective_privs() correctly which
would cause it to regain privileges too early. This could be abused
to make man create files as user man.

This has been fixed in version 2.3.16-4, and we recommend that you 
upgrade your man-db package immediately. If you use suidmanager you 
can also use that to make sure man and mandb are not installed suid
which protects you from this problem. This can be done with the
following commands:


   suidregister /usr/lib/man-db/man root root 0755
   suidregister /usr/lib/man-db/mandb root root 0755


    
Of course even when using suidmanager an upgrade is still strongly 
recommended.

');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2001/dsa-059');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2001/dsa-059
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:H/Au:N/C:N/I:P/A:N');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA059] DSA-059-1 man-db");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-059-1 man-db");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'man-db', release: '2.2', reference: '2.3.16-4');
if (deb_report_get()) security_note(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
