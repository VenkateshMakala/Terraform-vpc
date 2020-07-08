######Regions and Availability Zones

variable "AWS_REGIONS" {
  default = "ap-south-1"
}

variable "AZS" {
  type = list
  default = ["ap-south-1a", "ap-south-1b"]
}

######VPC Details

variable "VPC_CIDR" {
  default = "10.10.0.0/16"
}

variable "VPC_TAG"{
  default = "test-delete"
}

variable "VPC_ID" {}



######PUBLIC-Subnet Details

variable "PUBLIC_SUBNET_CIDR" {
  type = list
  default = ["10.10.0.0/24", "10.10.1.0/24"]
}

variable "PUBLIC_SUBNET_TAGS" {
  type = list
  default = ["test-delete-public-subnet-1a", "test-delete-public-subnet-1b"]
}

variable "PUBLIC_SUBNET_ID" {
  type = list
}

variable "IGW_TAG" {
  default = "Test-Delete-igw"
}

variable "PUBLIC_ROUTE_TABLE_TAG" {
  default = "test-delete-public-rt"
}

variable "PUBLIC_ROUTE_TABLE_ID" {}

variable "INTERNET_GATEWAY_ID" {}

variable "EIP_TAG" {
  default = "nat-gateway-eip"
}

variable "EIP_ID" {}

variable "NAT_PUBLIC_SUBNET_ID" {}

######PRIVATE-Subnet Details

variable "PRIVATE_SUBNET_CIDR" {
  type = list
  default = ["10.10.2.0/24", "10.10.3.0/24"]
}

variable "PRIVATE_SUBNET_TAGS" {
  type = list
  default = ["test-delete-private-subnet-1a", "test-delete-private-subnet-1b"]
}

variable "PRIVATE_SUBNET_ID" {
  type = list
}

variable "PRIVATE_ROUTE_TABLE_TAG" {
  default = "test-delete-privat-rt"
}

variable "PRIVATE_ROUTE_TABLE_ID" {}

variable "NAT_GATEWAY_TAG" {
  default = "test-delete-nat"
}


variable "NAT_GATEWAY_ID" {}

