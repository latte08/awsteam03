resource "aws_route_table" "t03_public" {


  vpc_id = "${aws_vpc.t03vpc.id}"

  route {

    cidr_block = "0.0.0.0/0"


    gateway_id = "${aws_internet_gateway.t03igw.id}"


  }

}


resource "aws_route_table_association" "t03_public_1a"{

  route_table_id = "${aws_route_table.t03_public.id}"
  subnet_id = "${aws_subnet.public_1a.id}"

}

resource "aws_route_table" "t03_private" {


  vpc_id = "${aws_vpc.t03vpc.id}"


  route {


    cidr_block     = "0.0.0.0/0"


    nat_gateway_id = "${aws_nat_gateway.t03_1c.id}"


  }

}


