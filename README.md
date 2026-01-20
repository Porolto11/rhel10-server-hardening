# RHEL 10 Secure Server Hardening

This is my home lab project.

## What I built
- Minimal CLI RHEL 10 server in VirtualBox
- Apache web server with basic security (hidden version info)
- SSH hardening: no root login + rate limiting (3 attempts/min)
- Automated patching script

## Important commands I used
- Register & update:
  sudo subscription-manager register
  sudo subscription-manager attach --auto
  sudo dnf update -y

- Apache setup:
  sudo dnf install httpd -y
  sudo systemctl enable --now httpd
  sudo firewall-cmd --permanent --add-service=http
  sudo firewall-cmd --reload

- Hardening:
  # In /etc/httpd/conf/httpd.conf:
  ServerTokens Prod
  ServerSignature Off

  # In /etc/ssh/sshd_config:
  PermitRootLogin no

  # SSH protection (native firewalld):
  sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="0.0.0.0/0" service name="ssh" limit value="3/m" drop'
  sudo firewall-cmd --reload

- Auto-patch script: auto-patch.sh (see file)

Built with free Red Hat Developer subscription.
January 2026 - Cegléd, Hungary
RHEL Server
