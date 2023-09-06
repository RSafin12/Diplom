resource "yandex_alb_target_group" "super-tg" {
  name      = "super-target-group"

  target {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    ip_address   = "${yandex_compute_instance.web-1.network_interface.0.ip_address}"
  }

  target {
    subnet_id = "${yandex_vpc_subnet.subnet-2.id}"
    ip_address   = "${yandex_compute_instance.web-2.network_interface.0.ip_address}"
  }
}















# documentation
# https://terraform-provider.yandexcloud.net/Resources/alb_target_group
