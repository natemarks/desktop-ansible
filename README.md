# desktop-ansible
This project provides ansible roles to manage the configuration of a  curated list of ansible roles to add tool/configurations to your (ubuntu 18.04/20.04) linux desktop.

Roles can be installed by:
 - committing them in this project in the roles/ directory
 - using an ansible-galaxy requirements file (ex. ansible_requirements.yml)

## Prerequisites
This assumes your logged into your account wiht a user naem created something like this:
```shell
# 
sudo useradd "spiderman" -s /bin/bash -m -d "/home/spiderman"
sudo usermod -aG sudo "spiderman"
sudo passwd spiderman
```


## Getting Started


**Clone this project**
The cd to the project root
```shell
git clone https://github.com/natemarks/desktop-ansible.git
cd desktop-ansible

sudo ansible-playbook ~/desktop-ansible/shell_playbook.yml 
[WARNING]: No inventory was parsed, only implicit localhost is available
[WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
what is the user account to configure: spiderman

```
Alternatively provide the  usernaem like this:
```shell
sudo ansible-playbook ~/desktop-ansible/shell_playbook.yml --extra-vars "desktop_user=spiderman"

```
**Downlaod the anyconnect pre-install tarball for linux64**


** Make sure you're running Ubuntu 18.04 or newer and remvoe python2 **
```shell
lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 20.04.2 LTS
Release:	20.04

```

**Setup the project python environment**

```bash
sudo apt-get install -y curl
curl -s https://raw.githubusercontent.com/natemarks/desktop-ansible/main/scripts/setup.sh | bash
```
Requirements: Setup python3 as your interpreter. We test on 3.9.2

run make roles, to create the virtual environment in the project directory and download and install galaxy roles
```shell
make roles
```


**Review (or run) the example_playbook.yml**

edit the file to put username in the config for golang:
```yaml
---
- name: Install Go and Hugo
  become: true
  hosts: localhost
  connection: local
  vars:
    # change 'nate' to your user name
    desktop_user: nate
    golang_version: 1.15.8
  roles:
    - darkwizard242.hugo
    - golang
```


