resource "aws_security_group" "tool" {
  name = "${var.name}-sg"
  description = "${var.name}"

#  dynamic "ingress" {
#    for_each = var.ingress_rules
#    content {
#      description = ingress.values.description
#      from_port = ingress.values.from_port
#      to_port = ingress.values.to_port
#      protocol = ingress.values.protocol
#      cidr_blocks = ingress.values.cidr_blocks
#    }
#  }
  tags = {
    Name= "${var.name}-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  description = "Allow SSH from specfic CIDR"
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = var.port
  to_port = var.port
  ip_protocol = "tcp"
  description = "App port"
}

resource "aws_vpc_security_group_egress_rule" "out" {
  security_group_id = aws_security_group.tool.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}