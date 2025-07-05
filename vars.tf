variable "REGION" {
  default = "ap-south-1"
}

variable "ZONES" {
  default = ["ap-south-1a","ap-south-1b","ap-south-1a","ap-south-1b"]
}

# variable "ZONE1" {
#   default = "ap-south-1a"
# }

# variable "ZONE2" {
#   default = "ap-south-1b"
# }

# variable "ZONE3" {
#   default = "ap-south-1c"
# }

variable "INSTACETYPE" {
  default = "t2.micro"
}


variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1 = "ami-01216e7612243e0ef"
  }

}

variable "USER" {
  default = "ec2-user"
}

variable "PUB_KEY" {
  default = "terraformkey.pub"
}

variable "PRIV_KEY" {
  default = "terraformkey"
}

variable "LOCALIP" {
  default = "49.37.47.173/32"
}

variable "COUNT" {
  default = "1"
}

variable "VPC" {
  default = "BISTRACKER"
}

variable "instance_tenancy" {
  default = "default"
}

variable "enable_dns_support" {
  default = "true"
}
variable "enable_dns_hostnames" {
  default = "true"
}

variable "map_public_ip_on_launch" {
  default = "true"
}


variable "VPC_CIDR_BLOCK" {
  default = "10.0.0.0/16"
}

variable "SUBNATE_CIDR" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24","10.0.4.0/24","10.0.5.0/24"]
  # default = "10.0.1.0/24"
}

# variable "PUB_SUB2_CIDR" {
#   default = "10.0.2.0/24"
# }

# variable "PRIVATE_SUB_CIDR" {
#   type    = list(string)
#   default = ["10.0.4.0/24","10.0.5.0/24"]
# }

# variable "PRIVATE_SUB2_CIDR" {
#   default = 
# }