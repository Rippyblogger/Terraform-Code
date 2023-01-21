module "consul" {

  source   = "git@github.com:wardviaene/terraform-consul-module.git?ref=terraform-0.12"
  key_name = aws_key_pair.test_key.key_name
  key_path = var.PRIVATE_KEY_PATH
  vpc_id   = aws_default_vpc.module_vpc.id
  subnets  = local.subnet_id_binding


}