aws_region = "ap-south-1"

vpc_config = {
  cidr_block        = "10.0.0.0/16"
  subnet_cidr_block = "10.0.1.0/24"
}

ec2_config = {
  ami_id        = "ami-0d03cb826412c6b0f"
  instance_type = "t2.micro"
  instance_name = "basic-instance"
}