variable "environment" {
  type    = string
  default = "staging"
}

module "servers" {
  source  = "./servers"
  servers = var.environment == "production" ? 2 : 1
}

module "databases" {
  source = "./databases"
}

output "ip_address" {
  value = module.servers.ip_address
}
