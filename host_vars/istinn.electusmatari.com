---
ansible_ssh_user: ansible
ansible_ssh_private_key_file: ~/.ssh/ansible_id_rsa
ansible_ssh_public_key_file: ~/.ssh/ansible_id_rsa.pub
# From http://faq.hosteurope.de/index.php?cpid=11514
apt_uri_list:
  - ftp://ftp.hosteurope.de/mirror/ftp.debian.org/
  - http://ftp.de.debian.org/
apt_uri_security_list:
  - ftp://ftp.hosteurope.de/mirror/ftp.debian.org/debian-security
  - http://security.debian.org/
