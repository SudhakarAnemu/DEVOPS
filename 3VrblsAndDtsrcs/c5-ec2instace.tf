
#Resource block
# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  #ami = "ami-0c02fb55956c7d316"
  ami = data.aws_ami.amzlinux2.id
  #instance_type = "t3.micro"
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "EC2 Demo 2"
  }
}



