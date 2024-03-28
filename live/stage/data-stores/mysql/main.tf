terraform {
  backend "s3" {
    bucket = "jflores-terraform-up-and-running-state"
    key    = "stage/data-storage/mysql/terraform.tfstate"
    region = "us-west-2"

    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "example" {
  identifier                  = "terraform-up-and-running"
  engine                      = "mysql"
  allocated_storage           = 10
  instance_class              = "db.t3.micro"
  skip_final_snapshot         = true
  db_name                     = "example_database"

  username = var.db_username
  password = var.db_password
}
