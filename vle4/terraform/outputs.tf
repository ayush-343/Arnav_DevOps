output "vpc_id" { value = aws_vpc.lab.id }
output "public_ips" { value = aws_instance.lab[*].public_ip }
output "instance_ids" { value = aws_instance.lab[*].id }
output "subnet_id" { value = aws_subnet.public.id }
