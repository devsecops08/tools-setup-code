variable "tools"  {
    default = {
    
    vault =  {
       port= 8200
       volume_size= 20 
       instance_type="t3.small"
       policy_list =[]
    }
    github-runner ={
      port= 80
      volume_size= 20
      instance_type="t3.small"
      policy_list= ["ec2:*","route53:*"]
    }

}
}

variable "zone_id" {
  default = "Z0285213QK7SB76TI5I9"
}
variable "domain_name" {
  default = "adevsecops08.online"
}

