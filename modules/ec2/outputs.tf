output instance_id {
value = aws_instance.Public-Servers.*.id
}


output public_dns {
value = aws_instance.Public-Servers.*.public_dns
}
