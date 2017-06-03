# aws
aws_region = "us-east-1"
aws_shared_credentials_file = "/root/.aws/credentials"
aws_profile = "terraform"

# instance
aws_instance_ami = "ami-ae7bfdb8"
aws_instance_type = "t2.micro"
aws_instance_provisioner_connection_type = "ssh"
aws_instance_provisioner_connection_user = "centos"
aws_instance_tags_name = "jenkins"

# key pair
aws_key_pair_name = "terraform"
aws_key_pair_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvW4YD11fV79ojwUTcNlypFMKTQXcI6zYeIorpQUDXZv8j/ngk2GflufCTHtXu4QOQ/YgQxQvlCOt6Ghk43PS2zYvSRtaov7KzvxYhy4wUPB7BLzwIkzBBNr2nm06KoI4w5a1XsP/tzFxKpeP79Y3UYnlC4O1cEtJ8/jaj9zutDTNzKhxC3S/HSrBY7rtePSpDBi02w/oYEEyF933NuoDHy4mmfZx8NdnI4tpogFCdtW3o5LgPkSxUrpCNwCbNc9wFyXjA771TYAnD+LuBtGdOiG3aWLe4olgI/lGK/1KoCHQ0FMvDPiyGZoYjC8QpRsjPi0HiDGkOuacN8iQ6uCOytWZrx+l9xmV/rVik6p/9U8kPMI13ygxRu7sw1xbpWEKlBs6CO5cQYaA6rC1lBpEbHtpWfxDJuXVPv9Jx76mn0tK9PoJU0Yh2hYwth3SQ9yVTsO2ainPD4JmvRoxDYThGHCf1aiAsiMYbt2Tozzru6XE51cDPhj0ktXN9cR83+lWbnCjhALI4pGcOelI0wQ/M6SfuD+OdNbRm0xXs2tuOFWJ2jMSj2PuXkRAyWmjOY2xQnhn1HMimCYKandPtop4RKAg9Wtrl+wHT5nZXjecLxLrCsnxgy16okxp9jApPimLvvoJjEt7omHjJFwKdSpmiZi0Om62q4vClLIBQCpNQLQ== terraform"

# secutiry_group
aws_security_group_default = "default"

aws_security_group_tcp_http_8080_name = "tcp_http_8080"
aws_security_group_tcp_http_8080_description = "Allow inbound traffic on port 8080."
aws_security_group_tcp_http_8080_tags_name = "tcp_http_8080"
aws_security_group_tcp_http_8080_ingress_from_port = 8080
aws_security_group_tcp_http_8080_ingress_to_port =8080
aws_security_group_tcp_http_8080_ingress_protocol = "tcp"
aws_security_group_tcp_http_8080_ingress_cird_blocks = ["0.0.0.0/0"]

aws_security_group_tcp_ssh_22_name = "tcp_ssh_22"
aws_security_group_tcp_ssh_22_description = "Allow inbound traffic on port 22."
aws_security_group_tcp_ssh_22_tags_name = "tcp_ssh_22"
aws_security_group_tcp_ssh_22_ingress_from_port =22
aws_security_group_tcp_ssh_22_ingress_to_port =22
aws_security_group_tcp_ssh_22_ingress_protocol = "tcp"
aws_security_group_tcp_ssh_22_ingress_cird_blocks = ["0.0.0.0/0"]

# vpc
aws_vpc_id = "vpc-24702f42"
