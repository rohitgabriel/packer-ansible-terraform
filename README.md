# Automating provisioning with packer, ansible and terraform
```
Install packer, terraform, ansible, gitlab, gitlab runner, awscli
```

## Pre installation
```
aws configure
vi ~/.terraformrc
credentials "app.terraform.io" {
  token = "terraform token"
}
```

## Setup bastion host
```
cd packer-ansible-terraform
./build-and-launch.sh
```

