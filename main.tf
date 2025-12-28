module "tool" {
  source = "./module-infra"
  instance_type = "t3.micro"
  name = "vault"
  port=8200
}
