resource "aws_security_group" "terraform_stack_sg" {
  vpc_id      = aws_vpc.BISTRACKER.id
  name        = "terraform-stack-sg"
  description = "Sec Grp for terraform ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  tags = {
    Name = "allow-ssh"
  }


}

resource "aws_security_group" "Bastian_Server_sg" {
  vpc_id      = aws_vpc.BISTRACKER.id
  name        = "Bastian_Server_sg"
  description = "Sec Grp for Bastian Server"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  tags = {
    Name = "allow-ssh"
  }


}

resource "aws_security_group" "BISTRACKER_DB_SERVER_sg" {
  vpc_id      = aws_vpc.BISTRACKER.id
  name        = "BISTRACKER_DB_SERVER_sg"
  description = "Sec Grp for DB Server"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.LOCALIP]
  }

  tags = {
    Name = "allow-ssh"
  }


}