## Build in function -- regex --> it says we can use port 8080 or 80 if not error

variable "external_port" {
  type = number 
  default = 8080
  validation {
    condition = can(regex("8080|80", var.external_port))
    error_message = "Port values can only be 8080 or 80"
  } 
}