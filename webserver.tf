resource "aws_instance" "WebServer" {
  count                         = length(var.webServer_tags)
  ami                           = data.aws_ami.latest-amazon-linux-image.id
  instance_type                 = local.instance_type
  associate_public_ip_address   = local.public_ip_enabled
  key_name                      = local.key_name 
  subnet_id                     = aws_subnet.pub_subnets[count.index].id
  vpc_security_group_ids        = [aws_security_group.Web-SG.ids]

  tags                          = {
      Name                      = var.webServer_tags[count.index]
  }
  depends_on = [ aws_vpc.vnet, aws_subnet.pub_subnets]
}