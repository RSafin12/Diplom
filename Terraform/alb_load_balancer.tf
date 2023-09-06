resource "yandex_alb_load_balancer" "webservers-lb" {
  name        = "webservers-load-balancer"

  network_id  = yandex_vpc_network.network-1.id
  
  allocation_policy { # расположение балансировщика 
    location {
      zone_id   = "ru-central1-a"
      # subnet_id = yandex_vpc_subnet.subnet-1.id
      subnet_id = yandex_vpc_address.lb_ip.id
      }
  }
  
  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 8080 ]
    }    
    http {
      handler {
        http_router_id = yandex_alb_http_router.tf-router.id
      }
    }
  }
  
  log_options {
    discard_rule {
      http_code_intervals = ["2XX"]
      discard_percent = 75
    }
  }
}


# Documentation
# https://terraform-provider.yandexcloud.net/Resources/alb_load_balancer