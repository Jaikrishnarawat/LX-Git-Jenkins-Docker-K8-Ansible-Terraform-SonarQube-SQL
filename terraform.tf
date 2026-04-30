It is Infrastructure provisioning (creating) tool. extention will be .tf

teraform syntax :-

block  parameter_type  parameters_name {

       arguments 

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