module "ec2" {
  source = "git::https://github.com/vaheedgit26/Infra.git//modules/ec2"

  ami_id                      = var.ami_id
  public_key_name             = var.public_key_name
  sg_ids                      = [module.nat_sg.sg_id]
  subnet_id                   = var.public_subnet_ID_to_launch_nat_instance  # "subnet-088e8443a70102e2a" #1a
  associate_public_ip_address = true
  is_nat_instance             = var.is_nat_instance  # creates NAT instance if true
  is_eip_required             = var.is_eip_required
  # user_data                 = file("${path.module}/nat_user_data.sh")

  project_name                = var.project_name
  env                         = var.env
  common_tags                 = var.common_tags
}
