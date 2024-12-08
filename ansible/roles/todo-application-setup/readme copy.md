
# Laravel Infrastructure Setup

This is an Ansible role designed to automate the setup of laravel application.

## Features

- Installs Mysql, Redis, PHP and Nginx
- Creates User and Database for laravel application 
- Installs php dependicies

## Run Locally

1. Set up your inventory file for your application host:
```bash
[all]
ansible_host=10.129.182.195 ansible_port=22
```

2. Setup your id_rsa.pub key in remote ansible hosts

3. Run the playbook to set up MySQL replication:

```bash
ansible-playbook -i inventory.ini sitefiles/todo-setup.yml --private-key=~/.ssh/id_rsa --become -u ubuntu
```

