variable "image_name" {
  type        = string
  default     = "jammy"
}

variable "disk_size" {
  type        = string
  default     = "10G" 
}

variable "instance_name" {
  type        = string
  default     = "laravel-todo"
}

variable "memory" {
  type        = string
  default     = "2G"
}

variable "cpus" {
  type        = number
  default     = 2
}