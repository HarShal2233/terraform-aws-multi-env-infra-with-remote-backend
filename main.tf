module "dev_infra" {
  source = "./infra-app"

  env               = "dev"
  bucket_name       = "infra-app-bucket"
  instance_count    = 1
  instance_type     = "t2.micro"
  ec2_ami_id        = "ami-07062e2a343acc423" # Ubuntu 22.04 LTS
  hash_key          = "StudentId"
}

module "prod_infra" {
  source = "./infra-app"

  env               = "prod"
  bucket_name       = "infra-app-s3-bucket"
  instance_count    = 2
  instance_type     = "t2.medium"
  ec2_ami_id        = "ami-07062e2a343acc423" # Ubuntu 22.04 LTS
  hash_key          = "StudentId"
}

module "staging_infra" {
  source = "./infra-app"

  env               = "staging"
  bucket_name       = "infra-app-s3-bucket"
  instance_count    = 1
  instance_type     = "t2.small"
  ec2_ami_id        = "ami-07062e2a343acc423" # Ubuntu 22.04 LTS
  hash_key          = "StudentId"
}