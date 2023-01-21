resource "aws_s3_bucket" "state_storage" {
  bucket = "my-tf-test-bucket-52343"
  force_destroy = true
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.state_storage.id
  acl    = "private"
}

output "bucket_id" {
  value = aws_s3_bucket.state_storage.id
}

