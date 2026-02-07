variable "tools" {
  default = {
    # vault={
    #   instance_type="t3.micro"
    #   port= 8200
    # }
    github-runner={
      instance_type= "t3.micro"
      port= 443

    }
  }
}

module "tool" {
  for_each = var.tools
  source = "./module-infra"
  instance_type = each.value.instance_type
  name = each.key
  port=each.value.port
}