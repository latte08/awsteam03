resource "aws_internet_gateway" "t03igw" {

  vpc_id = "${aws_vpc.t03vpc.id}"
}

