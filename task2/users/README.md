WARNING: I execute all playbooks as tests from root user. The root user in production enviroment must be disabled,
and a user with a different name must be created for deployment.

In "ansible.cfg" change remote_user to deployment user name.

In "inventory' file add IP addresse deployment hosts.

"Files" folder stored users ssh public keys in format username.key.pub.

For example:
mikhail.sinelnikov.key.pub

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDM7aAhmj0NvpLwscKNpLwlVTTznheMi2k46hY+BlytViUBYRVgLJl1ZST1+QpA7+4xL1++oVaFU3gsvD+rkLUdBOJWyzNeHuj3C3haFWj+VKYZTsO8lZCewk41rGBwoMFGAxYQQOGqImZ89iWP+biEffS08pa0MSTL+NBYFqHrBuy7VLD6O6zZgT67ZCQiR8JDWrH7wT27DkkZ8J/ajSX1K1sRJqyZLqjo6lyAcNINO9r19gKJg0ljjSL/G2xPtES2HDx3EtNjQvYCe1UMPLs0alYM/x0fbolOhq2iywB2ci0A60Z5yO44coIGJcqwaxRZJfgT+ttQ+oXB2NdCfCSsqXhKCwpZjXLHOd3lBMptHTxsry6BQoLONvyJb8TEQjVXPH2O9kIyFcOaouYZnh+qapBxnM8tWK4HwMHFrIMX/4ibWk2OTtO1j2i5IbQ9QpKjhUN6xWwy6Cfh37HSQbaz/pdP2Vov03dJpyrbDyDp0r+SMZIa9SkunhSJym5dZMXZjz0vqo91pgHARwF1Jy2TvAw2RlSmRpC7r3KN5BrV8ORvcDVLO4qi+SSouCgnYJFdhcNZwJi7ul45wsTWNwqZv4v5yJLOMdvTurbjs2lHLh47PoD9LQUoZFMF+TVYP9V4X4CaagBOkcDtC5hqMCjEXbnlSFaAQ+HiOI3R3QqUsw== mikhail.sinelnikov

1. secure_ssh.yml
Ansible playbook installs fail2ban and configures the security of the SSH server 

No parameters.

2. add_users_without2fa.yml
Ansible playbook add users without 2FA with SSH key 

Parameters:
    # Users list
    users:
    - mikhail.sinelnikov
    # Groups list
    grps: sudo,www-data
    # Shell name
    shell: /bin/bash
    # With sudo? yes/no
    sudo_wo_passwd: yes

3. add_users_with2fa.yml
Ansible playbook add users with Google 2FA PAM with SSH key 

Parameters:
    # Users list
    users:
    - mikhail.sinelnikov
    # Groups list
    grps: sudo,www-data
    # Shell name
    shell: /bin/bash
    # With sudo? yes/no
    sudo_wo_passwd: yes
    # Google auth version
    google_auth_version: 1.0

4. modify_users.yml
Ansible playbook  modify users parameters 

Parameters:
    # Users list
    users:
    - vasya.pupkin
    # Groups list
    grps: users
    # Shell name
    shell: /bin/sh
    # With sudo? yes/no
    sudo_wo_passwd: no

5. remove_2fa.yml
Ansible playbook disable Google 2FA for users 

Parameters:
    # Users list
    users:
    - vasya.pupkin


6. remove_users.yml
Ansible playbook remove users.

Parameters:
    # Users list
    users:
    - vasya.pupkin
