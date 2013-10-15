[Ansible](http://ansibleworks.com/) playbook to set up a server to run
the electusmatari.com site.

The server needs an `ansible` user which can log in without password
using the secret key defined in `host_vars/istinn.electusmatari.com`,
and can sudo to root without password.

You might also need to adjust the variable `secrets_dir` in
`emcom.yml`.

Run ansible as follows:

```
ansible-playbook -i production emcom.yml
```
