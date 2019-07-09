resource "aws_security_group" "bastion" {

  name        = "bastion"
  description = "open ssh port for bastion"
  vpc_id = "${aws_vpc.t03vpc.id}"

  ingress {

    from_port   = 22
    to_port     = 22
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


resource "aws_eip" "bastion_1a" {

  instance = "${aws_instance.bastion_1a.id}"
  vpc      = true


}


resource "aws_instance" "bastion_1a" {
  ami               = "${var.amazon_linux}"
  availability_zone = "ap-northeast-1a"
  instance_type     = "t2.nano"
  key_name          = "${var.t03_keyname}"

  vpc_security_group_ids = [
    "${aws_security_group.bastion.id}",
    "${aws_default_security_group.t03_default.id}"
  ]

subnet_id                   = "${aws_subnet.public_1a.id}"
  associate_public_ip_address = true

}

