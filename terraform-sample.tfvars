aws_access_key = "TU_AWS_ACCESS_KEY"
aws_secret_key = "TU_AWS_SECRET_KEY"
cluster_name = "eks-mundos-e"
vpc_cidr = "10.0.0.0/16"
node_group_desired_size = 2
node_group_max_size = 3
node_group_min_size = 1
node_group_instance_type = "t3.small"
ec2_instance_type = "t2.micro"
ec2_name = "DevOps-Project"
ec2_key_name = "devops"
#Agregar los scripts que se necesiten
user_data_scripts =[]