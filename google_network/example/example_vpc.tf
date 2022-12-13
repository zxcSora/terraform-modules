module "vpc-test" {
  source              = "../module"
  network_name        = "spider-net"
  network_description = "net for true spider man"
  subnets = {
    mini-spider-net = {
      subnet_name     = "mini-spider-net"
      subnet_region   = "europe-west4"
      subnet_ip_range = "10.130.56.0/21"
    }
    big-spider-net = {
      subnet_name     = "big-spider-net"
      subnet_region   = "europe-west4"
      subnet_ip_range = "10.140.56.0/21"
    }
  }
  additional_ip_ranges = {
    big-spider-net = [
      {
        range_name    = "additional-big-spider-net"
        ip_cidr_range = "10.130.64.0/18"
      }
    ]
    mini-spider-net = [
      {
        range_name    = "additional-mini-spider-net"
        ip_cidr_range = "10.130.128.0/17"
      }
    ]
  }
}
