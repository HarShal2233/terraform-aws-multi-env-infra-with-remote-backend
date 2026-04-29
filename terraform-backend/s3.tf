resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "tai-tf-s3-bucket"

    tags = {
        Name = "tai-tf-s3-bucket"
    }
  
}