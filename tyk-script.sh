#!/bin/bash
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/mongodb-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/redis-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/tyk-gateway-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/pump-install-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/tyk-dashboard-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/license-tyk-dashboard.yml --extra-vars 'variable_host=pipeline'