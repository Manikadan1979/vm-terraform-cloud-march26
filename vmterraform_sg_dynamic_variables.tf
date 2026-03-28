##cresate a varaible file a4.sg-variables.tf

variable "allowed_ingress_ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "List of allowed ingress ports for the security group"

}

variable "allowed_cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "List of allowed CIDR blocks for ingress rules"

}