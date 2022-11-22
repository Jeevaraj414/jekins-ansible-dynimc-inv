provider "aws"{
   region  = "ap-south-1" 
   
}

resource "aws_instance" "AWSEC2Instance"{
     count   = 1
     ami     =  "ami-019774e5caffd1685"
     instance_type = "t2.micro"
     security_groups = ["launch-wizard-2"]
     key_name      = "jeevarajdevops"
     tags = {
        Name = "tomcatserver"
     }
}
