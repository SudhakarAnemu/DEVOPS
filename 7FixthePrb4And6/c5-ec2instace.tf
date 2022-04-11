#Resource block
# Resource: EC2 Instance
resource "aws_instance" "myec2vm" {
  #ami = "ami-0c02fb55956c7d316"
  ami = data.aws_ami.amzlinux2.id
  #instance_type = "t3.micro"
  instance_type = var.instance_type #normal 
  #instance_type = var.instace_type_list[1] #list --> working good
  #instance_type = var.instance_type_map["qa"] #map
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  #count                  = 2 #It creates 5 instances of this resource, its a map. 

  #Create EC2 instance in all Availability Zones of a VPC
  #for_each          = toset(data.aws_availability_zones.my_azones.names)
  for_each = toset(keys({ for az, details in data.aws_ec2_instance_type_offerings.my_ins_type :
  az => details.instance_types if length(details.instance_types) != 0 }))
  availability_zone = each.key
  #it will have each.key and each.value

  tags = {
    "Name" = "for_each-Demo-${each.value}"
  }
}

