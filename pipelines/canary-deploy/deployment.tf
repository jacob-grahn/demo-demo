module "primary_deployment" {
    source = "./deployment"
    name = "nginx-primary"
    replicas = 3
}

module "standby_region" {
    source = "./deployment"
    name = "nginx-canary"
    replicas = 1
}