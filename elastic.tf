resource "aws_eip" "BISTRACKER-pub-1-eip" {
  vpc = true
  tags = {
    Name = "eip-nat-1a"
  }
}