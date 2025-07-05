resource "aws_nat_gateway" "BISTRACKER-pub-1-nat" {
  allocation_id = aws_eip.BISTRACKER-pub-1-eip.id
  subnet_id     = aws_subnet.BISTRACKER-pub-1.id
  depends_on    = [aws_internet_gateway.BISTRACKER-IGW]
}


resource "aws_route_table" "Public-RT-nat-1a" {
  vpc_id = aws_vpc.BISTRACKER.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.BISTRACKER-pub-1-nat.id

  }

  tags = {
    Name = "RT-nat-1a"
  }
}