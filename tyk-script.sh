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
ansible-vault encrypt ansible-terraform/vault/tyk-vault.yml --vault-password-file .vault_pass.txt
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/license-tyk-dashboard.yml --extra-vars 'variable_host=pipeline' --vault-password-file .vault_pass.txt
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/gitlab-install-playbook.yml --extra-vars 'variable_host=pipeline'
sleep 10
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/gitlab-configure-playbook.yml --extra-vars 'variable_host=pipeline'