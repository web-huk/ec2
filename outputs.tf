output "ec2_public_ips" {
    value = [ "${join(",", aws_instance.WebServer.*.public_ip)}" ]
}