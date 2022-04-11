# Datasource

data "aws_ec2_instance_type_offerings" "my_ins_type2" {

  for_each = toset(["us-east-1a", "us-east-1e"])
  #, "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f", "us-east-1g"])
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

output "output_v2_1" {
  #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
  value = toset(
    [
      for t in data.aws_ec2_instance_type_offerings.my_ins_type2 : t.instance_types
    ]
  )
}

# Output - map

output "output_v2_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_ins_type2 : az => details.instance_types
  }
}