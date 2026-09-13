resource "aws_instance" "app" {
  ami                         = "ami-01a00762f46d584a1"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_1.id
  private_ip                  = "10.0.1.77"
  vpc_security_group_ids      = [aws_security_group.app.id]
  key_name                    = "wild_tour_devops_KP"
  associate_public_ip_address = true

  tags = {
    Name = "wild-tour-app-01"
  }
}
