resource "aws_lb" "k8_lb" {
    name                = "kubernetes-nlb"
    internal            = false
    load_balancer_type  = "network"
    subnets             = [aws_subnet.main.id]
}

resource "aws_lb_target_group" "k8_target_group" {
    name     = "kubernetes-tg"
    port     = "6443"
    protocol = "TCP"
    vpc_id   = aws_vpc.my_vpc.id
}

resource "aws_lb_target_group_attachment" "k8_controller_attachment" {
    count            = length(aws_instance.k8_nodes)
    target_group_arn = aws_lb_target_group.k8_target_group.arn 
    target_id        = aws_instance.k8_nodes[count.index].id 
}

resource "aws_lb_target_group_attachment" "k8_worker_attachment" {
    count            = length(aws_instance.k8_worker_nodes)
    target_group_arn = aws_lb_target_group.k8_target_group.arn 
    target_id        = aws_instance.k8_worker_nodes[count.index].id 
}

resource "aws_lb_listener" "k8_listener" {
    load_balancer_arn = aws_lb.k8_lb.arn
    port              = "443"
    protocol          = "TCP"

    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.k8_target_group.arn  
    }
}


