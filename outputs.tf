output "alb_dns_name" {
  description = "ALB DNS name."
  value       = aws_lb.alb.dns_name
}

output "web_url" {
  description = "HTTP demo URL. Null when TLS is enabled; use the domain matching your ACM certificate instead."
  value       = var.certificate_arn == null ? "http://${aws_lb.alb.dns_name}" : null
}

output "db_endpoint" {
  description = "Private RDS endpoint; reachable from the web security group."
  value       = aws_db_instance.db.endpoint
}

output "db_master_secret_arn" {
  description = "ARN of the RDS-managed master secret; the password is not output."
  value       = aws_db_instance.db.master_user_secret[0].secret_arn
}

output "s3_bucket" {
  description = "Private assets bucket."
  value       = aws_s3_bucket.assets.bucket
}

output "asg_name" {
  description = "Auto Scaling group name."
  value       = aws_autoscaling_group.web.name
}
