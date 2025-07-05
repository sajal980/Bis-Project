resource "aws_key_pair" "terraform-key" {
  key_name   = "terraformkey"
  public_key = file(var.PUB_KEY)
}