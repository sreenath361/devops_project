resource "aws_instance" "Public-Servers" {
    count = var.machinecount
    ami = var.imagename
    #ami = "${lookup(var.amis, var.aws_region)}"
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = "${element(var.public_subnets, count.index)}"
    vpc_security_group_ids = [var.sg]
    associate_public_ip_address = true	
    tags = {
        Name = "Public-Server-${count.index+1}"
        Env = var.environment
        Owner = "Sreenath Reddy"
	CostCenter = "ABCD"
    }
#iam_instance_profile = var.iam_instance_profile
}
