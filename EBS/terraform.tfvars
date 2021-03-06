vpc_id              = "vpc-05c6ee9d5235528e7"
Instance_type       = "t2.micro"
minsize             = 1
maxsize             = 2
subnets             = ["subnet-082589fc138622a34", "subnet-0f9b57890b3a604f1"] 

tier = "WebServer"
solution_stack_name= "64bit Amazon Linux 2 v3.3.11 running Python 3.8"
alb_cidr_block = ["131.228.2.0/27","131.228.32.160/27"]
