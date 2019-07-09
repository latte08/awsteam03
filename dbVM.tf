resource "aws_security_group" "t03db" {

  name        = "t03db"
  description = "open ssh mysql port for t03db"
  vpc_id = "${aws_vpc.t03vpc.id}"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_eip" "t03db_1c" {

  instance = "${aws_instance.t03db_1c.id}"
  vpc      = true

}


resource "aws_instance" "t03db_1c" {
  ami               = "${var.amazon_linux}"
  availability_zone = "ap-northeast-1c"
  instance_type     = "t2.micro"
  key_name          = "t03_key"

  vpc_security_group_ids = [
    "${aws_security_group.t03db.id}",
    "${aws_default_security_group.t03_default.id}"
  ]

 subnet_id                   = "${aws_subnet.private_1c.id}"
  associate_public_ip_address = true

}

