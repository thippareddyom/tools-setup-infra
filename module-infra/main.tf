data "aws_ami" "ami" {
  most_recent = true
  owners = ["973714476881"]
  filter {
    name = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}
resource "aws_instance" "tool" {
  ami=data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.tool.id]
  tags = {
    Name= var.name
  }
}


data "aws_route53_zone" "get_zone_id" {
  name = "kvsr.online"
}

resource "aws_route53_record" "private" {
  zone_id = data.aws_route53_zone.get_zone_id.id
  records = [aws_instance.tool.private_ip]
  ttl = 10
  type = "A"
  name = "${var.name}-internal"
}

resource "aws_route53_record" "public" {
  zone_id = data.aws_route53_zone.get_zone_id.id
  records = [aws_instance.tool.public_ip]
  ttl = 10
  type = "A"
  name = "${var.name}"
}



