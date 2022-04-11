

# Datasource 1 - get the list of availabilty zones. 

data "aws_availability_zones" "my_azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}


# Datasource 2

data "aws_ec2_instance_type_offerings" "my_ins_type" {

  #for_each = toset(["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f", "us-east-1g"])
  for_each = toset(data.aws_availability_zones.my_azones.names)
  filter {
    name   = "instance-type"
    values = ["t3.micro"]
  }

  filter {
    name = "location"
    #values = ["us-east-1a"]
    #values = ["us-east-1e"]
    values = [each.key]
  }

  location_type = "availability-zone"
}

# Output
output "output_v3_1" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type : az => details.instance_types
  }
}

#exclude un supported zon
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type : 
    az => details.instance_types if length(details.instance_types) !=0
  }
}


#exclude un supported zon --> get only keys
output "output_v3_3" {
  description = "Capture only kesy (names of the Azones)"
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type : 
    az => details.instance_types if length(details.instance_types) !=0
  })
}

#exclude un supported zon --> lets pick only one value (index 2)
output "output_v3_4" {
  #description = "Capture only kesy (names of the Azones)"
  value = keys({
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type : 
    az => details.instance_types if length(details.instance_types) !=0
  })[2]
}