resource "aws_key_pair" "my_key" {

    key_name = "${var.env}-terra-key"
    public_key = file("terra-key13.pub")
 
}

resource "aws_default_vpc" "my_vpc" {

    tags = {
      name = "Default-vpc"
    }
  
}

resource "aws_security_group" "my_SG" {

    name = "${var.env}-my_sg"
    description = "my securtiy group"
    vpc_id = aws_default_vpc.my_vpc.id
  
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_SG.id
}

resource "aws_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_SG.id
}

resource "aws_security_group_rule" "outgoing" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = -1
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.my_SG.id
}

resource "aws_instance" "my_ec2" {
    
    count = var.count_instance
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_SG.name]
    instance_type = var.instance
    ami = "ami-0b6c6ebed2801a5cb"

    root_block_device {
      
      volume_size = var.size_root_block_device
      volume_type = "gp3"

    }

    tags = {
      purpose = "${var.env}-infra"
    }
    
  
}

