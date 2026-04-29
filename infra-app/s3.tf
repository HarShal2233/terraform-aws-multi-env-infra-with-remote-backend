resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "${var.env}-${var.bucket_name}-${random_id.bucket_suffix.hex}"

    tags = {
        Name = "${var.env}-infra-app-s3-bucket"
        Environment = var.env
    }
  
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}