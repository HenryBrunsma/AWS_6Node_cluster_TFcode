resource "aws_security_group" "example" {
    name    = "Kubernetes-from-scratch"
    description = "kubernetes from scratch - security group"
    vpc_id = aws_vpc.my_vpc.id
tags = {
    Name = "kubernetes_SG"
 }
}

resource "aws_security_group_rule" "sg_rule_all1" {
    type        = "ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "sg_rule_all2" {
    type        = "ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.200.0.0/16"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "sg_rule_SSH" {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "sg_rule_k8" {
    type        = "ingress"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "sg_rule_https" {
    type        = "ingress"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp" 
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}

resource "aws_security_group_rule" "sg_rule_icmp" {
    type        = "ingress"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp" 
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.example.id
}