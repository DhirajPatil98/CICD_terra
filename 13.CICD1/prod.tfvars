env= "prod"
instance = "t2.micro"
size_root_block_device = 20
count_instance = 1

azs = ["us-east-1a"]
public = ["10.0.1.0/24", "10.0.2.0/24"]
private = ["10.0.101.0/24", "10.0.102.0/24"]