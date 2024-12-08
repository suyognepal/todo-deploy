# Todo Application Setup

This Ansible role sets up a web server with PHP, Nginx, and MySQL to host a Laravel Todo application.

## Requirements

This role requires the following:

* Ubuntu 20.04 or later
* Ansible 2.12 or later

## Role Variables

The following variables are used by this role:

* `php_version`: The version of PHP to install. Defaults to `8.3`.
* `php_modules`: A list of additional PHP modules to install. Defaults to an empty list.
* `mysql_root_password`: The password to set for the MySQL root user. Defaults to `test@123#`.
* `mysql_user`: The username to create for the MySQL user. Defaults to `todo_user`.
* `mysql_password`: The password to set for the MySQL user. Defaults to `todo@123#`.
* `mysql_database`: The name of the MySQL database to create. Defaults to `todo`.

# Running the playbook
```bash
ansible-playbook -i todo-application-setup/inventory/inventory.ini sitefiles/todo-setup.yml --private-key=~/.ssh/id_rsa --become -u ubuntu -e todo-application-setup/vars/vars.yaml
```
