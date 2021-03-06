#
# (C) Tenable Network Security, Inc.
#
# This script contains information extracted from VuXML :
#
# Copyright 2003-2006 Jacques Vidrine and contributors
#
# Redistribution and use in source (VuXML) and 'compiled' forms (SGML,
# HTML, PDF, PostScript, RTF and so forth) with or without modification,
# are permitted provided that the following conditions are met:
# 1. Redistributions of source code (VuXML) must retain the above
#   copyright notice, this list of conditions and the following
#   disclaimer as the first lines of this file unmodified.
# 2. Redistributions in compiled form (transformed to other DTDs,
#   published online in any format, converted to PDF, PostScript,
#   RTF and other formats) must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer
#   in the documentation and/or other materials provided with the
#   distribution.
#
# THIS DOCUMENTATION IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY,
# OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS DOCUMENTATION,
# EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#
#

include('compat.inc');

if ( description )
{
 script_id(21527);
 script_version("$Revision: 1.4 $");
 script_cve_id("CVE-2005-2498");

 script_name(english:"FreeBSD : pear-XML_RPC -- remote PHP code injection vulnerability (2388)");

script_set_attribute(attribute:'synopsis', value: 'The remote host is missing a security update');
script_set_attribute(attribute:'description', value:'The following package needs to be updated: b2evolution');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N');
script_set_attribute(attribute:'solution', value: 'Update the package on the remote host');
script_set_attribute(attribute: 'see_also', value: 'http://b2evolution.net/news/2005/08/31/fix_for_xml_rpc_vulnerability_again_1
http://downloads.phpgroupware.org/changelog
http://drupal.org/files/sa-2005-004/advisory.txt
http://phpadsnew.com/two/nucleus/index.php?itemid=45
http://sourceforge.net/project/shownotes.php?release_id=349626
http://www.hardened-php.net/advisory_142005.66.html
http://www.hardened-php.net/advisory_152005.67.html
http://www.phpmyfaq.de/advisory_2005-08-15.php');
script_set_attribute(attribute:'see_also', value: 'http://www.FreeBSD.org/ports/portaudit/e65ad1bf-0d8b-11da-90d0-00304823c0d3.html');

 script_end_attributes();
 script_summary(english:"Check for b2evolution");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 family["english"] = "FreeBSD Local Security Checks";
 script_family(english:family["english"]);
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/FreeBSD/pkg_info");
 exit(0);
}
global_var cvss_score;
cvss_score=5;
include('freebsd_package.inc');


holes_nb += pkg_test(pkg:"pear-XML_RPC<1.4.0");

holes_nb += pkg_test(pkg:"phpmyfaq<1.4.11");

holes_nb += pkg_test(pkg:"drupal<4.6.3");

holes_nb += pkg_test(pkg:"eGroupWare<1.0.0.009");

holes_nb += pkg_test(pkg:"phpAdsNew<2.0.5");

holes_nb += pkg_test(pkg:"phpgroupware<0.9.16.007");

holes_nb += pkg_test(pkg:"b2evolution<0.9.0.12_2");

if (holes_nb == 0) exit(0,"Host is not affected");
