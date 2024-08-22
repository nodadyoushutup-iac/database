locals {
  provider = yamldecode(file("/mnt/workspace/provider.yaml"))
  config = try(yamldecode(file("/mnt/workspace/config.yaml")), yamldecode(file("/mnt/workspace/config.yml")))
  component = {
    database = contains(local.config.component, "database")
    vault = contains(local.config.component, "vault")
    npm = contains(local.config.component, "npm")
    development = contains(local.config.component, "development")
    fortigate = contains(local.config.component, "fortigate")
    k3s = contains(local.config.component, "k3s")
    monitoring = contains(local.config.component, "monitoring")
  }
}
