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
  # source = "github.com/jpxcz/terraform_up_and_running_modules//services/webserver-cluster?ref=v0.0.1"
  source = "../../../../modules/services/webserver-cluster"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "jflores-terraform-up-and-running-state"
  db_remote_state_key    = "stage/data-storage/mysql/terraform.tfstate"

  enable_autoscaling = false
  server_text        = "New server staging text 2"
  instance_type      = "t3.micro"
}

resource "aws_security_group_rule" "allow_testing_inbound" {
  type              = "ingress"
  security_group_id = module.webserver_cluster.alb_security_group_id

  from_port   = 12345
  to_port     = 12345
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}
