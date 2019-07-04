# Automating provisioning with packer, ansible and terraform
```
Install packer, terraform, ansible, gitlab, gitlab runner, awscli

packer-ansible-terraform$ cd .. ; rm -rf packer-ansible-terraform; git clone https://github.com/rohitgabriel/packer-ansible-terraform.git; cd packer-ansible-terraform
```

## Pre installation on localhost
```
aws configure
vi ~/.terraformrc
credentials "app.terraform.io" {
  token = "terraform token"
}
```

## Configure local host with ansible
```
cd packer-ansible-terraform
ansible-playbook  ansible/selfconfig-playbook.yml
```

## Provision pipeline host with terraform, packer, ansible
```
cd packer-ansible-terraform
./build-and-launch.sh
```

## Install Mongodb with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/mongodb-playbook.yml --extra-vars 'variable_host=pipeline'
```

## Install redis with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/redis-playbook.yml --extra-vars 'variable_host=pipeline'
```

## Install tyk gateway with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/tyk-gateway-playbook.yml --extra-vars 'variable_host=pipeline'
```

## Install pump with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/pump-install-playbook.yml --extra-vars 'variable_host=pipeline'
```

## Install tyk dashboard with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/tyk-dashboard-playbook.yml --extra-vars 'variable_host=pipeline'
```
