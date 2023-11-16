resource "ansible_host" "server" {
  count = length(var.private_ips)
  name = "server-${count.index}"
  groups = (count.index > 0 ? ["loadbalancer"] : ["web_servers"])
  variables = {
    ansible_host = var.private_ips[count.index]
    ansible_user = "ubuntu"
    ansible_ssh_private_key_file = var.key_path
  }
}