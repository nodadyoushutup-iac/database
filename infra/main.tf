# main.tf

module "database" {
  source  = "spacelift.io/nodadyoushutup/virtual_machine/proxmox"
  # version = "1.0.0"
  vm_id = 101
  name = "database"
  description = "Database services"
  tags = ["terraform", "ubuntu", "database"]
  disk = {
    size = 50
  }
  memory = {
    dedicated = 4096
  }
  cpu = {
    cores = 2
  }
  initialization = {
    ip_config = {
      ipv4 = {
        address = "192.168.1.101/24"
        gateway = "192.168.1.1"
      }
    }
  }
}

# resource "spacelift_context_attachment" "config_database" {
#   count = local.component.database ? 1 : 0
#   context_id = "config"
#   stack_id   = "database"
#   priority   = 100
# }

# resource "spacelift_context_attachment" "provider_database" {
#   count = local.component.database ? 1 : 0
#   context_id = "provider"
#   stack_id   = "database"
#   priority   = 100
# }