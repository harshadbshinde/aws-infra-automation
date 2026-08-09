variable "ami_ids" {
  type = map(string)
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}


variable "key_name" {
  type        = string
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.0.0/24"
}

variable "availability_zone" {
  default = "ap-south-1a"
}

