# Key Pair (login)
 
 resource aws_key_pair my_key_pair {
   key_name   = "${var.env}-infra-app-key"
   public_key = file("terraform-key-ec2.pub")
   tags = {
      Environment = var.env
   }
   
 }


# VPC & Security Group

resource aws_default_vpc default {
  
}

resource "aws_security_group" "my_security_group" {
    name = "${var.env}-infra-app-sg"
    description = "This will add an TF Generated Security Group"
    vpc_id = aws_default_vpc.default.id

    # Inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        description = "Allow SSH access from anywhere"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        description = "Allow HTTP access from anywhere"
    }


    # Outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]         
    }




    tags = {
      Name = "${var.env}-infra-app-sg"
    }
}


# ec2 instance

resource "aws_instance" "my_ec2_instance" {
  count = var.instance_count

  depends_on = [ aws_security_group.my_security_group ]

  ami           = var.ec2_ami_id # Ubuntu
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.env == "prod" ? 20 : 10
    volume_type = "gp3"
  }
         
  tags = {
    Name = "${var.env}-infra-app-ec2"
    Environment = var.env
  }
}

#resource "aws_instance" "my_new_instance" {
#  ami           = "unknown"
#  instance_type = "unknown"
#
#}

