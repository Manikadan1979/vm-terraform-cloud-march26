variable "region" {
  type = string #list of string map or string
  #in string varaible we can provide a single string value
  description = "The AWS region to create resources in"
  default     = "us-east-1" #input value for the variable if we are not providing any value then it will take this default value
}

variable "vpc_cidr" {
  type        = string #no default value provided for this variable so it will be mandatory to provide a value for this variable when we run terraform apply command
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}

variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}