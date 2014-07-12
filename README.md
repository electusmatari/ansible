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
apt-get install python-apt git python-jinja2 python-yaml python-dev
git clone https://github.com/ansible/ansible.git
. ansible/hacking/env-setup
```

After that, the `ansible-playbook` command above should work.

On recent Ubuntu you will need to install mysql-server and mysql-client
manually beforehand, with no root password, otherwise it ends up with an
unusable password.

After pushing the other packages into the correct git repositories, a
/srv/emcom/venv/bin/pip install -r /srv/emcom/electusmatari.com/requirements.txt
should install all dependencies.
