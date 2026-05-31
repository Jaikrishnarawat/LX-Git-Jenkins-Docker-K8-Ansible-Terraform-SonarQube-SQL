It is Infrastructure provisioning (creating) tool. extention will be .tf

teraform syntax :-

block  resource_type  resource_name {
property1 : "value"
property2 : "value"   

}


( Parameter_tyoe can be local, aws_provider, Azure_provider.
 block can be variable, resource, output. ) 


4 imp commands:-
teraform init 
teraform validate 
teraform plan 
teraform apply 


some advanced commands of teraform:-

teraform taint :- mark a resource for recreation during the next week. 

teraform import :- used to bring existing Infrastructure under teraform management.

teraform graph :- generate a visual dependency graph of your teraform resource. 

teraform state :- used to inspect , move or remove item in the teraform state file manually.

debugging teraform:- when teraform behave unexpectedly ( error, worng , resource change , provide issue ) you can enable debugging on logging too se what going on internally. 





example:- Creating multiple EC2 instance in AWS 


resource "aws_instance" "web"{
        count = 3
        ami = ami-0679hffhjjbcddtj
        instance-type = "t2.micro"

tag {
Name = "web-server-${count.index}"
}
}


# Create an isolated VPC network space
resource "aws_vpc" "devops_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name        = "devops-project-vpc"
    Environment = "Development"
  }
}


# Create a public subnet for hosting web/app servers
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.devops_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "devops-public-subnet"
  }
}


# Attach an Internet Gateway to allow external traffic flow
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops_vpc.id

  tags = {
    Name = "devops-vpc-igw"
  }
}

tag are not compulsory to use.
