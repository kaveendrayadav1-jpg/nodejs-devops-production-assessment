resource "aws_instance" "node_app" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = var.instance_type

  tags = {
    Name        = "nodejs-app"
    Environment = var.environment
  }
}
