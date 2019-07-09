resource "aws_security_group" "t03web" {

  name        = "t03web"
  description = "open ssh httpd port for t03web"
  vpc_id = "${aws_vpc.t03vpc.id}"

  ingress {

    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {

    from_port   = 80
    to_port     = 80
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


resource "aws_eip" "t03web_1a" {

  instance = "${aws_instance.t03web_1a.id}"
  vpc      = true

}


resource "aws_instance" "t03web_1a" {
  ami               = "${var.amazon_linux}"
  availability_zone = "ap-northeast-1a"
  instance_type     = "t2.micro"
  key_name          = "t03_key"

  vpc_security_group_ids = [
    "${aws_security_group.t03web.id}",
    "${aws_default_security_group.t03_default.id}"
  ]

 subnet_id                   = "${aws_subnet.public_1a.id}"
  associate_public_ip_address = true

}

