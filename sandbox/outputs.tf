#VPC ID
output vpc_id {
    value = module.testenv.vpc_id
}

output all_public_subnets {
    value = module.testenv.all_public_subnets
}

output all_private_subnets {
    value = module.testenv.all_private_subnets
}
#public Subets Ids
output subnetId1 {
    value = module.testenv.subnetId1
}
output subnetId2 {
    value = module.testenv.subnetId2
}
output subnetId3 {
    value = module.testenv.subnetId3
}

#SG ID
output sg_id {
    value = module.testenv.sg_id
}

#Environment
output env {
    value = module.testenv.env
}

#EC@ insance IDs
output instance_id {
value = module.test-ec2.instance_id
}

#EC2 Instance Public_DNS
output public_dns {
value = module.test-ec2.public_dns
}
