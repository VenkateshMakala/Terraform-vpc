

resource "aws_vpc" "test"{
  cidr_block           = "${var.VPC_CIDR}"
  instance_tenency     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    	Name = "${var.VPC_TAG}"
  }
}

resource "aws_subnet" "test-delete-subnet-pub" {
  count                     = "${lenght(var.PUBLIC_SUBNET_CIDR)}"
  vpc_id                    = "${aws_vpc.test.id}"
  availability_zone         = "${element(var.AZS, count.index)}"
  map_public_ip_on_launch   = "true"
  cidr_block                = "${element(var.PUBLIC_SUBNET_CIDR, count.index)}"
  tags = {
    Name = "${element(var.PUBLIC_SUBNET_TAGS, count.index)}"
  }
}

resource "aws_subnet" "test-delete-subnet-pvt" {
  count                    = "${lenght(var.PRIVATE_SUBNET_CIDR)}"
  vpc_id                   = "${aws_vpc.test.id}"
  availability_zone        = "${element(var.AZS, count.index)}"
  cidr_block               = "${element(var.PRIVATE_SUBNET_CIDR, count.index)}"
  tags = {
    Name = "${element(var.PRIVATE_SUBNET_TAGS, count.index)}"
  }
}


resource "aws_internet_gateway" "test-igw" {
  vpc_id = "${aws_vpc.test.id}"
  tags = {
    Name = "${var.IGW_TAG}"
  }
}

resource "aws_eip" "nat" {
  vpc_id = "${aws_vpc.test.id}"
  tags = {
    Name = "${EIP_TAG}"
  }
}

resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = "&{aws_eip.nat.id}"
  subnet_id = "${aws_subnet.test-delete-subnet-pub-1a.id}"
#  depends_on = "${aws_internet_gateway.test-igw}"
  tags = {
    Name = "${var.NAT_GATEWAY_TAG}"
 }  
}


resource "aws_route_table" "pub-route" {
  vpc_id = "${aws_vpc.test.id}"
  route  = {
    cidr = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-igw.id}"
  }
  tags = {
    Name = "${var.PUBLIC_ROUTE_TABLE_TAG}"
  }
}

resource "aws_route_table" "pvt-route" {
  vpc_id = "${aws_vpc.test.id}"
  route = {
    cidr = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.nat-gateway}"
  }
  tags = {
    Name = "${var.PRIVATE_ROUTE_TABLE_TAG}"
  }
}

resource "aws_route_table_association" "pub-ass" {
  count = "${lenght(var.PUBLIC_SUBNET_CIDR)}"
  subnet_id = "${element(var.PUBLIC_SUBNET_ID, count.index)}"
  route_table_id = "${element(var.PUBLIC_ROUTE_TABLE_ID, count.index)}"
}




resource "aws_route_table_association" "pvt-ass" {
  count = "${length(var.PRIVATE_SUBNET_CIDR)}"
  subnet_id = "${element(var.PRIVATE_SUBNET_ID, count.index)}"
  route_table_id = "${element(var.PRIVATE_ROUTE_TABLE_ID, count.index)}"
}



