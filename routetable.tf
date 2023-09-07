resource "aws_route_table" "example" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name= "Kubernetes_rt"
    }
}

resource "aws_route" "my_route" {
    route_table_id      = aws_route_table.example.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
}

resource "aws_route_table_association" "a" {
    subnet_id       = aws_subnet.main.id
    route_table_id      = aws_route_table.example.id
}