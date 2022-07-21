# Modules


module "demo" {
  source = "./demo"

   # Application specific variable
  ec2_configuration = var.ec2_configuration
  directory_details        = var.directory_details
  gateway_vpc_endpoint     = var.file_gateway_vpc_endpoint

}
