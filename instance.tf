
resource "aws_instance" "terraform-web" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTACETYPE
  subnet_id              = aws_subnet.bistracker_subnets.id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.terraform_stack_sg.id]
  tags = {
    Name       = "BISTRACKER-INSTANCE"
    cretatedBy = "Sajal"
    Project    = "BISTRACKER"
    CostCenter = "9876"
    OS         = "Amazon Linux"

  }
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file(var.PRIV_KEY)
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "vol_4_terraform" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    Name = "extr-vol-4-terraform"
  }
}

resource "aws_volume_attachment" "atch_vol_terraform" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_terraform.id
  instance_id = aws_instance.terraform-web.id
}

output "PublicIP_terraform-web" {
  value = aws_instance.terraform-web.public_ip
}

output "PrivateIP_terraform-web" {
  value = aws_instance.terraform-web.private_ip
}

output "PublicIP_DB-Server" {
  value = aws_instance.DB-Server.public_ip
}

output "PrivateIP_DB-Server" {
  value = aws_instance.DB-Server.private_ip
}

output "PublicIP_Bastian-Server" {
  value = aws_instance.Bastian-Server.public_ip
}

output "PrivateIP_Bastian-Server" {
  value = aws_instance.Bastian-Server.private_ip
}

resource "aws_instance" "Bastian-Server" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTACETYPE
  subnet_id              = aws_subnet.bistracker_subnets.id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.Bastian_Server_sg.id]
  tags = {
    Name       = "BISTRACKER-BASTIAN-SERVER"
    cretatedBy = "Sajal"
    Project    = "BISTRACKER"
    CostCenter = "9876"
    OS         = "Amazon Linux"

  }

}

resource "aws_instance" "DB-Server" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = var.INSTACETYPE
  subnet_id              = aws_subnet.bistracker_subnets.id
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = [aws_security_group.BISTRACKER_DB_SERVER_sg.id]
  tags = {
    Name       = "BISTRACKER-DB-SERVER"
    cretatedBy = "Sajal"
    Project    = "BISTRACKER"
    CostCenter = "9876"
    OS         = "Amazon Linux"

  }

}