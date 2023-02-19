############################################
# Adds 0 to status.txt when create resources
############################################

resource "null_resource" "exe1" {
  provisioner "local-exec" {
    command = "echo '0' > status.txt"
    }
############################################
# Adds 1 status when destroy resources
############################################
  provisioner "local-exec" {
    when = destroy
    command = "echo '1' > status.txt"
    }
}
