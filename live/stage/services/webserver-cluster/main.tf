provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      Owner     = "team-foo"
      ManagedBy = "terraform"
    }
  }
}

module "webserver_cluster" {
  source = "github.com/jpxcz/terraform_up_and_running_modules//services/webserver-cluster?ref=v0.0.1"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "jflores-terraform-up-and-running-state"
  db_remote_state_key    = "stage/data-storage/mysql/terraform.tfstate"
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
