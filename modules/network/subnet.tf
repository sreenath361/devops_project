resource "aws_subnet" "public-subnets" {
    count= "${length(var.publiccidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.publiccidrs, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
        Name = "Public-Subnet-${count.index+1}"
    }
}

resource "aws_subnet" "private-subnets" {
    count= "${length(var.privatecidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.privatecidrs, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
        Name = "Private-Subnet-${count.index+1}"
    }
}
