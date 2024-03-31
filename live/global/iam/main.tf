provider "aws" {
  region = "us-west-2"
}

module "users" {
    source = "../../../modules/landing-zone/iam-user"
    count = length(var.user_names)
    user_name = var.user_names[count.index]
}

# resource "aws_iam_user" "example" {
#   count = length(var.user_names)
#   name  = var.user_names[count.index]
# }
