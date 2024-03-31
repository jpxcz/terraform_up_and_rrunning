output "first_arn" {
    value = module.users[0].arn
    description = "The ARN of the fist user"
}

output "all_arns" {
    value = module.users[*].arn
    description = "The ARNs for all users"
}
