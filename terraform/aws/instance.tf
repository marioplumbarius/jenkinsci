resource "aws_instance" "jenkins" {
    ami = "${var.aws_instance_ami}"
    instance_type = "${var.aws_instance_type}"
    security_groups = [
        "${aws_security_group.tcp_http_8080.name}",
        "${aws_security_group.tcp_ssh_22.name}",
        "${var.aws_security_group_default}"
    ]
    key_name = "${aws_key_pair.terraform.key_name}"

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install -y git",
            "sudo yum install https://packages.chef.io/files/stable/chef/13.0.118/el/7/chef-13.0.118-1.el7.x86_64.rpm -y",
            "cd /tmp",
            "git clone https://github.com/marioluan/jenkinsci.git",
            "cd jenkinsci/terraform/aws/chef/",
            "sudo chef-client --local-mode --runlist 'recipe[dockerce]'"
        ]

        connection {
            type = "${var.aws_instance_provisioner_connection_type}"
            user = "${var.aws_instance_provisioner_connection_user}"
            private_key = "${file("${path.module}/.ssh/terraform")}"
        }
    }

    tags {
        Name = "${var.aws_instance_tags_name}"
    }
}
