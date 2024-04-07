provider "aws" {
  region = "us-west-2"
}

module "webserver_cluster" {
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-prod"
  db_remote_state_bucket = "jflores-terraform-up-and-running-state"
  db_remote_state_key    = "prod/data-storage/mysql/terraform.tfstate"

  enable_autoscaling = true

  custom_tags = {
    Owner     = "team-foo"
    ManagedBy = "terraform"
  }
}

