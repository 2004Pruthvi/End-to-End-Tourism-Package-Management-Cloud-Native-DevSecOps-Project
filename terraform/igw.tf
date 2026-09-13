resource "aws_internet_gateway" "wild_tour" {
  vpc_id = aws_vpc.wild_tour.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}
