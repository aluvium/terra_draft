variable "img_name" {
  description = "Image to pull from registry"
  type = string
  default = "nginx:1.23"
}

variable "port" {
  description = "ports we want open - first go internal , external"
  type = list
  default = [ 80, 8080 ]
  sensitive = true
}
