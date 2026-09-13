resource "aws_route_table" "public" {
  vpc_id = aws_vpc.wild_tour.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wild_tour.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.wild_tour.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}
