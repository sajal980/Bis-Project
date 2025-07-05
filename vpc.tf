resource "aws_vpc" "BISTRACKER" {
  cidr_block           = var.VPC_CIDR_BLOCK
  instance_tenancy     = var.instance_tenancy
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "BISTRACKER-vpc"
  }
}

resource "aws_subnet" "bistracker_subnets" {
  vpc_id                  = aws_vpc.BISTRACKER.id
  # count = 4
  count = length(var.SUBNATE_CIDR)
  cidr_block = var.SUBNATE_CIDR[count.index]
  availability_zone       = var.ZONES[count.index]
  map_public_ip_on_launch = var.map_public_ip_on_launch
}

/* resource "aws_subnet" "BISTRACKER-pub-1" {
  vpc_id                  = aws_vpc.BISTRACKER.id
  cidr_block              = var.PUB_SUBNATE_CIDR[0]
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "BISTRACKER-pub-1"
  }
}

resource "aws_subnet" "BISTRACKER-pub-2" {
  vpc_id                  = aws_vpc.BISTRACKER.id
  cidr_block              = var.PUB_SUBNATE_CIDR[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch
  availability_zone       = var.ZONE2
  tags = {
    Name = "BISTRACKER-pub-2"
  }
} */


/* resource "aws_subnet" "BISTRACKER-pub-3" {
  vpc_id                  = aws_vpc.BISTRACKER.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "BISTRACKER-pub-3"
  }
} */


/* resource "aws_subnet" "BISTRACKER-priv-1" {
  vpc_id     = aws_vpc.BISTRACKER.id
  cidr_block = var.PRIVATE_SUB_CIDR[0]
  # map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    Name = "BISTRACKER-priv-1"
  }
}


resource "aws_subnet" "BISTRACKER-priv-2" {
  vpc_id     = aws_vpc.BISTRACKER.id
  cidr_block = var.PRIVATE_SUB_CIDR[1]
  # map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    Name = "BISTRACKER-priv-2"
  }
} */


/* resource "aws_subnet" "BISTRACKER-priv-3" {
  vpc_id                  = aws_vpc.BISTRACKER.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "BISTRACKER-priv-3"
  }
} */

resource "aws_internet_gateway" "BISTRACKER-IGW" {
  vpc_id = aws_vpc.BISTRACKER.id
  tags = {
    Name = "BISTRACKER-IGW"
  }
}

resource "aws_route_table" "BISTRACKER-pub-RT" {
  vpc_id = aws_vpc.BISTRACKER.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.BISTRACKER-IGW.id
  }

  tags = {
    Name = "BISTRACKER-pub-RT"
  }
}


/* resource "aws_route_table_association" "BISTRACKER-pub-1-a" {
  subnet_id      = aws_subnet.BISTRACKER-pub-1.id
  route_table_id = aws_route_table.BISTRACKER-pub-RT.id
}
 */
/* resource "aws_route_table_association" "BISTRACKER-pub-1-a" {
  subnet_id      = aws_subnet.bistracker_subnets[count.index[0]]
  route_table_id = aws_route_table.BISTRACKER-pub-RT.id
} */

resource "aws_route_table_association" "BISTRACKER-pub-2-a" {
  subnet_id      = aws_subnet.BISTRACKER-pub-2.id
  route_table_id = aws_route_table.BISTRACKER-pub-RT.id
}
/* resource "aws_route_table_association" "BISTRACKER-pub-3-a" {
  subnet_id      = aws_subnet.BISTRACKER-pub-3.id
  route_table_id = aws_route_table.BISTRACKER-pub-RT.id
} */
