
resource "aws_nat_gateway" "t03_1a" {


  allocation_id = "${aws_eip.nat_t03_1a.id}"


  subnet_id     = "${aws_subnet.public_1a.id}"


}





resource "aws_nat_gateway" "t03_1c" {


  allocation_id = "${aws_eip.nat_t03_1c.id}"


  subnet_id     = "${aws_subnet.private_1c.id}"


}

