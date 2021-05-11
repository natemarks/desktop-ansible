# desktop-ansible
Use this project to setup ansible on your desktop to use our curated list of ansible roles to add tool/configurations to your (ubuntu, for now) linux desktop.  After completing the project setup, you'll be able to use the example_playbook.yml to install a couple tools using the roles. You can also use that example to create and run your own playbooks

Roles can be installed by:
 - committing them in this project in the roles/ directory
 - using an ansible-galaxy requirements file (ex. ansible_requirements.yml)


## Getting Started

**Clone this project**
The cd to teh project root
```shell
git clone https://github.com/natemarks/desktop-ansible.git
cd desktop-ansible
```

**Setup the project python environment**
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
