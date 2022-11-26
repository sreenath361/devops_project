#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
    access_key = "AKIATX7VAWSQFYPOJQ4G"
    secret_key = "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"
    region = "us-east-1"
}
#Vpc Module
module testenv {
    source = "/root/devops_project/terraform_modules/modules/network"
    vpc_cidr = "10.1.0.0/16"
    vpc_name = "terraform-aws-testing"
    IGW_name = "terraform-aws-igw"
#Main_Routing_Table = "Terraform_Main_table-testing"
    key_name = "devops"
    environment = "Sandbox"
    azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
    publiccidrs = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
    privatecidrs = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
}

#EC@ instance creation module
module test-ec2 {
    source = "/root/devops_project/terraform_modules/modules/ec2"
    imagename = "ami-052efd3df9dad4825"
    instance_type = "t2.micro"
    key_name = "devops"
    environment = "${module.testenv.env}"
    machinecount = "${module.testenv.env == "Prod" ? 3: 1}"
    public_subnets = "${module.testenv.all_public_subnets}"
    sg = "${module.testenv.sg_id}"   
    iam_instance_profile = "${module.test_iam.instprofile}"
}

#IAM Module
module "test_iam" {
  source  = "/root/devops_project/terraform_modules/modules/iam"
  rolename = "terraform-ec2-testing-role"
  envname = "${module.testenv.env}"
  instanceprofilename = "ec2-testing-inst-profile"
}

#EFS filesystem creation Module
module "test_efs" {
  source  = "/root/devops_project/terraform_modules/modules/efs"
  efsname = "terraform-efs"
  subnets = "${module.testenv.all_public_subnets}"
  sg = "${module.testenv.sg_id}"
}
