#VPC ID
output vpc_id {
value = "${aws_vpc.default.id}"
}

output all_public_subnets {
value = aws_subnet.public-subnets.*.id
}

output all_private_subnets {
value = aws_subnet.private-subnets.*.id
}
#public Subets Ids
output subnetId1 {
value = aws_subnet.public-subnets.0.id
}
output subnetId2 {
value = aws_subnet.public-subnets.1.id
}
output subnetId3 {
value = aws_subnet.public-subnets.2.id
}

#SG ID
output sg_id {
value = aws_security_group.allow_all.id
}

#Environment
output env {
value = var.environment
}
