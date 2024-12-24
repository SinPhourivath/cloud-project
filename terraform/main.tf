resource "aws_instance" "app_instance" {
  ami           = "ami-0995922d49dc9a17d"
  instance_type = "t2.micro"
  key_name      = "final_cloud_project"

  tags = {
    Name = "TodoAppInstance"
  }
}