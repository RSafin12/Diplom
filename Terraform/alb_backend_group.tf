resource "yandex_alb_backend_group" "webservers-bg" {
  name      = "webservers-backend-group"

  http_backend {
    name = "web-http-backend"
    weight = 1
    port = 8080
    target_group_ids = ["${yandex_alb_target_group.super-tg.id}"]
    tls {
      sni = "backend-domain.internal"
    }
    load_balancing_config {
      panic_threshold = 50
    }    
    healthcheck {
      timeout = "1s"
      interval = "1s"
      http_healthcheck {
        path  = "/"
      }
    }
    http2 = "true"
  }
}



# Documentation
# https://terraform-provider.yandexcloud.net/Resources/alb_backend_group
