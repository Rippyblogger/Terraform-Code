resource "aws_key_pair" "my_keys" {
  key_name   = "deployer-key"
  public_key = file(var.PUBLIC_KEY_PATH)
}