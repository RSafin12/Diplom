resource "yandex_alb_http_router" "tf-router" {
  name      = "my-http-router"
  labels = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}




















# Documentation
# https://terraform-provider.yandexcloud.net/Resources/alb_http_router