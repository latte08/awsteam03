
resource "aws_default_network_acl" "t03_default" {


  default_network_acl_id = "${aws_vpc.t03vpc.default_network_acl_id}"


  ingress {

    protocol   = -1

    rule_no    = 100

    action     = "allow"

    cidr_block = "0.0.0.0/0"

    from_port  = 0

    to_port    = 0

  }


  egress {

    protocol   = -1

    rule_no    = 100

    action     = "allow"

    cidr_block = "0.0.0.0/0"

    from_port  = 0

    to_port    = 0

  }



  subnet_ids = [

    "${aws_subnet.public_1a.id}",

    "${aws_subnet.private_1c.id}"

  ]

}

