provider "aws"{
  profile = "all_profile"
}
resource "aws_instance" "app_instance" {
  ami           = "ami-0995922d49dc9a17d"
  instance_type = "t2.micro"
  key_name      = "cloud_project"
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = <<-EOF
              #install all package
              sudo yum update -y

              #install docker
              yum install -y docker
              sudo service docker start
              chkconfig docker on
              sudo usermod -aG docker ec2-user

              #install git
              sudo yum install git -y

              #aws cli
              curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
              unzip awscliv2.zip
              sudo ./aws/install

              #install mysql client
              sudo yum update -y
              sudo yum install -y mysql

              EOF

  tags = {
    Name = "TodoAppInstance"
  }
}