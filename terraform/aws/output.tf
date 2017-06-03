output "instance_public_dns" {
    value   = "${aws_instance.jenkins.public_dns}"
}

output "instance_public_ip" {
    value   = "${aws_instance.jenkins.public_ip}"
}
