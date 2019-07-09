
resource "aws_vpc" "t03vpc" {


  cidr_block           = "103.0.0.0/16"


  enable_dns_hostnames = true


  enable_dns_support   = true


  instance_tenancy     = "default"
}

