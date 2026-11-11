output "vpc_id" {
  description = "ID of the enterprise VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "CIDR range of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of public subnets"
  value = [
    aws_subnet.public_a.id,
    aws_subnet.public_b.id
  ]
}

output "private_subnet_ids" {
  description = "IDs of private subnets"
  value = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "network_auditor_policy_arn" {
  description = "ARN of the network auditor IAM policy"
  value       = aws_iam_policy.network_auditor.arn
}
