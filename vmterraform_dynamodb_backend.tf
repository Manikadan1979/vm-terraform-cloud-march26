#create a new file a7.backend.tf replace the name of the bucket replace the dynamodb table name
terraform {
  backend "s3" {
    bucket         = "vmterraform-s3-bucket-global" #replace with your s3 bucket name
    key            = "terraform.tfstate"            ##this is the file name which will be created in the s3 bucket to store the tfstate file
    region         = "us-east-1"
    dynamodb_table = "vmterraform-dynamodb-table-lock" #replace with your dynamodb table name which will be used for state locking
    encrypt        = true
  }
}