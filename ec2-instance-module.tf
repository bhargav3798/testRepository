#AWS EC2 instance module 

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-module-demo"
  instance_count         = 2

  ami                    = data.aws_ami.amzlinux.id
  instance_type          = "t2.micro"
  key_name               = "terraform-key"
  monitoring             =  true
  vpc_security_group_ids = ["sg-b82hhwh"] #Get Default VPC Security GroupID and
  subnet_id              = "subnet-4ee95470"  #Get one public subnet id from default

  tags = {
    Name        = "Modules-Demo"
    Terraform   = "true"
    Environment = "dev"
  } 
}