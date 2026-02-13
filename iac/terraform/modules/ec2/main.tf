# Create Security Group for each instance
resource "aws_security_group" "ec2_sg" {
  for_each = var.instances

  name   = "${each.key}-sg"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
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

  tags = {
    Name = "${each.key}-sg"
  }
}

# Create EC2 instances
resource "aws_instance" "this" {
  for_each = var.instances

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = each.value.subnet_id
  vpc_security_group_ids      = [aws_security_group.ec2_sg[each.key].id]
  associate_public_ip_address = true
  key_name                    = var.key_name
  user_data                   = file("${path.module}/user_data.sh")
  user_data_replace_on_change = true # Allows us to update user_data

  tags = {
    Name = each.key
  }
}