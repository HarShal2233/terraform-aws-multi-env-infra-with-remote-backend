resource "aws_dynamodb_table" "basic_dynamodb_table" {
    name           = "backend-tf-dynamodb-table"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "LockId"


    attribute {
        name = "LockId"
        type = "S"
    }

  

    tags = {
        Name        = "backend-tf-dynamodb-table"
    }
  
}