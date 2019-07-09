
resource "aws_subnet" "public_1a" {


  vpc_id            = "${aws_vpc.t03vpc.id}"


  availability_zone = "ap-northeast-1a"


  cidr_block        = "103.0.1.0/24"



}




resource "aws_subnet" "private_1c" {


  vpc_id            = "${aws_vpc.t03vpc.id}"


  availability_zone = "ap-northeast-1c"


  cidr_block        = "103.0.2.0/24"



}


