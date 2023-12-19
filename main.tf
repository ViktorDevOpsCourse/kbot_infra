module "kind_cluster" {
  source = "./modules/tf-kind-cluster"
}

module "github_repository" {
  source                   = "./modules/tf-github-access"
  github_owner             = var.github_owner
  github_token             = var.github_token
  github_repo              = var.github_repo
  public_key_openssh       = module.tls_private_key.public_key_openssh
  public_key_openssh_title = "flux0"
}

module "flux_bootstrap" {
  source            = "./modules/tf-flux-bootstrap"
  github_repository = "${var.github_owner}/${var.github_repo}"
  private_key       = module.tls_private_key.private_key_pem
  github_token      = var.github_token
  config_host       = module.kind_cluster.endpoint
  config_client_key = module.kind_cluster.client_key
  config_crt        = module.kind_cluster.crt
  config_ca         = module.kind_cluster.ca
}

module "tls_private_key" {
  source    = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  algorithm = "RSA"
}