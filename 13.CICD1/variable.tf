variable "env" {
  type = string
  
}

variable "instance" {
  type = string
  
}

variable "size_root_block_device" {

  type = number
  
}

variable "count_instance" {

    type = number
}

variable "azs" {
    type = list(string)
  
}

variable "public" {

    type = list(string)
  
}

variable "private" {

    type = list(string)
  
}