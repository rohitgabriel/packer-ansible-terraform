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

## Create ansible vault to encrypt license
```
cd packer-ansible-terraform
ansible-vault encrypt ansible-terraform/vault/tyk-vault.yml --vault-password-file .vault_pass.txt
```
## Add license and bootstrap node
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/license-tyk-dashboard.yml --extra-vars 'variable_host=pipeline' --vault-password-file .vault_pass.txt
```

## Install and configure gitlab with ansible
```
cd packer-ansible-terraform
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/gitlab-configure-playbook.yml --extra-vars 'variable_host=pipeline'
ansible-playbook -u 'centos' -i ansible-terraform/hosts.yml --private-key /home/ubuntu/keys/mykey ansible-terraform/gitlab-install-playbook.yml --extra-vars 'variable_host=pipeline'
```

## Set up helm
```
# Notes https://eksworkshop.com/helm/deploy/
# kubectl apply -f helm-rbac.yml
# helm init --service-account tiller
```

## Set up ALB ingress controller
```
# Notes https://eksworkshop.com/exposing_service/ingress_controller_alb/
# https://aws.amazon.com/blogs/opensource/kubernetes-ingress-aws-alb-ingress-controller/
# kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.0.0/docs/examples/rbac-role.yaml
# curl -sS "https://raw.githubusercontent.com/kubernetes-sigs/aws-alb-ingress-controller/v1.0.0/docs/examples/alb-ingress-controller.yaml" > alb-ingress-controller.yaml
```

## AWX notes
```
cd ~
git clone https://github.com/ansible/awx.git
cd installer 
vi inventory
Update the following:
 kubernetes_context=eks_<cluster name>
 kubernetes_namespace=awx
ansible-playbook -i inventory install.yml
```


