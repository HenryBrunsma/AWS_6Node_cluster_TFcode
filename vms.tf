data "aws_ami" "latest_ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "k8_nodes" {
  count = 3

  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t3.micro"

  subnet_id           = aws_subnet.main.id
  associate_public_ip_address = true
  key_name            = aws_key_pair.generated_k8_KeyPair.key_name
  security_groups    = [aws_security_group.example.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "name=controller-${count.index}" > /etc/metadata.txt
    EOF  

  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "controller-${count.index}"
  }
}

