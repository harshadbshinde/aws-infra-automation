resource "aws_instance" "my_ec2" {
  for_each = var.ami_ids

  ami                    = each.value
  instance_type          = var.instance_type
  key_name               = var.key_name

  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = each.key
  }
}