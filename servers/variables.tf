variable "image_id" {
  default     = "ami-094f380725f62923a"
  type        = string
  description = "ami id"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "invalid image_id value"
  }
}

variable "servers" {
  type = number
}

variable "instance_types" {
  type = list(string)
  default = ["t2.nano", "t2.micro", "t2.medium"]
}
