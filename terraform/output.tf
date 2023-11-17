output "instance_ip" {
  value = module.ec2.instance_ip
}
output "instance_private_ip" {
  value = module.ec2.instance_private_ip
}
output "sns_topic_arn" {
  value = module.sns_module.sns_topic_arn
}
output "vpc_id" {
  value = module.vpc.vpc_id
}
output "subnet_id" {
  value = module.vpc.subnet_id
}

resource "local_file" "IPs" {
  count    = length(module.ec2.instance_ip)
  content  = module.ec2.instance_ip[count.index]
  filename = "${path.root}/datapass/ip_${count.index}"
}
resource "local_file" "PrivateIPs" {
  count    = length(module.ec2.instance_private_ip)
  content  = module.ec2.instance_private_ip[count.index]
  filename = "${path.root}/datapass/private_ip_${count.index}"
}

resource "local_file" "sns_topic_arn" {
  content  = module.sns_module.sns_topic_arn
  filename = "${path.root}/datapass/sns_topic_arn"
}