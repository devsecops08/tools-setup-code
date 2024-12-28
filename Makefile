infra: 			  
	terraform init
	terraform apply -auto-approve

ansible:
 	ansible-playbook -i $(tool_name)-internal.adevsecops08.online, -e ansible_user=ec2-user -e ansible_password=DevOps321 -e tool_name=$(tool_name) -e vault_token=$(vault_toekn) main.yml
