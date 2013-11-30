[Ansible](http://ansibleworks.com/) playbook to set up a server to run
the electusmatari.com site.

The ansible script is set up to run on localhost. It needs the
packages python and python-apt installed.

Run ansible as follows:

```
ansible-playbook -i production emcom.yml -K
```

The `-K` will ask for a sudo password.

# Provisioning the Server

```
apt-get install python-apt git python-jinja2 python-pyyaml
git clone https://github.com/ansible/ansible.git
. ansible/hacking/env-setup
```

After that, the `ansible-playbook` command above should work.

Due to a bug in ansible
(https://github.com/ansible/ansible/issues/4441), the first run will
fail due to an existing home directory. Further runs will then work
fine.
