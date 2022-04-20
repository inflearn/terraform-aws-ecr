variable "name" {
  type = string
}

variable "encryption_type" {
  type    = string
  default = "AES256"
}

variable "scan_on_push" {
  type    = string
  default = "false"
}

variable "expire_count" {
  type    = number
  default = null
}

variable "image_tag_mutability" {
  type    = string
  default = "MUTABLE"
}

variable "tags" {
  type    = map(string)
  default = {}
}
