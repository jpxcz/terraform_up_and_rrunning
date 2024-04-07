variable "server_port" {
  description = "The port for the server will use for the HTTP request"
  type        = number
  default     = 8080
}

variable "cluster_name" {
  description = "The name to use for all the cluster resources"
  type        = string
}

variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  type        = string
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  type        = string
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "enable_autoscaling" {
  description = "If set to true, enable auto scaling"
  type        = bool
  default     = false
}

variable "ami" {
  description = "The AMI to run in the cluster"
  type        = string
  default     = "ami-08116b9957a259459"
}

variable "instance_type" {
  description = "The type of EC2 instance to run in the cluster"
  type        = string
  default     = "t2.micro"
}

variable "server_text" {
  description = "The text the web server should return"
  type        = string
  default     = "Hello, World!"
}
