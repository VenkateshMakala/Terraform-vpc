output "VPC_ID" {
  value = "${aws_vpc.test.id}"
}

output "PUBLIC_SUBNET_ID" {
  value = ["${aws_subnet.test-delete-subnet-pub.*.id}"]
}

output "PUBLIC_ROUTE_TABLE_ID" {
  value = "${aws_route_table.pub-route.id}"
}

output "INTERNET_GATEWAY_ID" {
  value = "${aws_internet_gateway.test-igw.id}"
}

output "EIP_ID" {
  value = "${aws_eip.nat.id}"
}

output "NAT_PUBLIC_SUBNET_ID" {
  value = "${aws_subnet.test-delete-subnet-pub.0.id}"
}

output "NAT_GATEWAY_ID" {
  value = "${aws_nat_gateway.nat-gateway.id}"
}

output "PRIVATE_SUBNET_ID" {
  value = ["${aws_subnet.test-delete-subnet-pvt.*.id}"]
}

output "PRIVATE_ROUTE_TABLE_ID" {
  value = "${aws_route_table.pvt-route.id}"
}
