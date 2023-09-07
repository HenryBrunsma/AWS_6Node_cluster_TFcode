resource "aws_instance" "k8_worker_nodes" {
  count = 3

  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = "t3.micro"

  subnet_id           = aws_subnet.main.id
  associate_public_ip_address = true
  key_name            = aws_key_pair.generated_k8_KeyPair.key_name
  security_groups    = [aws_security_group.example.id]

  user_data = <<-EOF
    #!/bin/bash
    echo "name=worker-${count.index}|pod-cidr=10.200.${count.index}.0/24" > /etc/metadata.txt
    EOF  

  root_block_device {
    volume_size = 50
  }

  tags = {
    Name = "worker-${count.index}"
  }
}
