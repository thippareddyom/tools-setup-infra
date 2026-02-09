module "tool" {
  for_each = var.tools
  source = "./module-infra"
  instance_type = each.value.instance_type
  name = each.key
  port=each.value.port
  iam_policy = each.value["iam_policy"]
}