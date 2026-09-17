# Ansible Configuration

## Overview

Phase 7 introduces Ansible for configuration management and application deployment of the Wild Tour application server.

The Ansible configuration manages:

- Git
- Java 17
- Docker service
- Wild Tour Docker Compose application

The configuration is organized using an Ansible role to make the automation reusable and maintainable.

## Architecture

```text
Ansible Control Node
        |
        v
   Wild Tour EC2
        |
        +-- Git
        |
        +-- Java 17
        |
        +-- Docker
        |
        +-- Docker Compose
                |
                v
          Wild Tour Application
Ansible Directory Structure
ansible/
├── ansible.cfg
├── inventory/
│   └── hosts.ini
├── playbooks/
│   └── site.yml
└── roles/
    └── wild_tour/
        └── tasks/
            └── main.yml
Ansible Configuration
The ansible.cfg file defines the inventory and role search path.
[defaults]
inventory = inventory/hosts.ini
host_key_checking = False
roles_path = roles
Inventory
The application server is defined in inventory/hosts.ini.
[app]
wild-tour-app ansible_connection=local ansible_python_interpreter=/usr/bin/python3
The local connection is used because Ansible is running directly on the Wild Tour EC2 instance.
Playbook
The main playbook is playbooks/site.yml.
---
- name: Configure Wild Tour application server
  hosts: app
  become: true

  vars:
    project_dir: /home/ubuntu/wild-tour-devops

  roles:
    - wild_tour
The playbook delegates the server configuration tasks to the wild_tour role.
Wild Tour Role
The role is located at:
roles/wild_tour/
Its main task file is:
roles/wild_tour/tasks/main.yml
The role performs four configuration tasks.
1. Git
Ensures Git is installed:
- name: Ensure Git is installed
  ansible.builtin.apt:
    name: git
    state: present
    update_cache: true
2. Java 17
Ensures Java 17 is installed:
- name: Ensure Java 17 is installed
  ansible.builtin.apt:
    name: openjdk-17-jdk
    state: present
3. Docker Service
Ensures Docker is running and enabled at boot:
- name: Ensure Docker service is running and enabled
  ansible.builtin.service:
    name: docker
    state: started
    enabled: true
4. Wild Tour Application
Uses the community.docker.docker_compose_v2 module to ensure the Wild Tour Compose application is running:
- name: Ensure Wild Tour application is running
  community.docker.docker_compose_v2:
    project_src: "{{ project_dir }}"
    state: present
Docker Collection
The community.docker Ansible collection is used for Docker Compose management.
Installed version:
community.docker 5.0.4
Validation
Ansible Syntax
The playbook was validated using:
ansible-playbook -i inventory/hosts.ini playbooks/site.yml --syntax-check
Result:
playbook: playbooks/site.yml
Playbook Execution
The playbook completed successfully:
ok=5
changed=0
unreachable=0
failed=0
skipped=0
Application Verification
The application was verified through Ansible's uri module.
status: 200
msg: "OK (4857 bytes)"
changed: false
This confirms that the Wild Tour application was reachable through Tomcat on port 8080.
Idempotency
The playbook was executed multiple times.
The final execution produced:
changed=0
failed=0
This demonstrates Ansible idempotency: when the server is already in the desired state, Ansible does not make unnecessary configuration changes.
Deployment Flow
The resulting deployment flow is:
Ansible Playbook
       |
       v
wild_tour Role
       |
       +---- Git
       |
       +---- Java 17
       |
       +---- Docker Service
       |
       +---- Docker Compose
                    |
                    v
             Wild Tour Container
                    |
                    v
                 Tomcat
                    |
                    v
              HTTP 200
Git
Phase 7 was committed with:
ccc581a feat: automate application server with Ansible
The commit was pushed successfully to the main branch.
Phase Status
Phase 7 — Ansible: COMPLETE
