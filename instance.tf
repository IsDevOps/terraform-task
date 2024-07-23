resource "aws_instance" "public_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id
  key_name      = data.aws_ssm_parameter.key_pair_name.value
  security_groups = [aws_security_group.public_sg.name]

  tags = {
    Name = "public_instance"
  }
}

resource "aws_instance" "private_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # 
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private.id
  key_name      = data.aws_ssm_parameter.key_pair_name.value
  security_groups = [aws_security_group.private_sg.name]

  tags = {
    Name = "private_instance"
  }
}
