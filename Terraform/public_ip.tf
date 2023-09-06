resource "yandex_vpc_address" "lb_ip" {
  name = "lb_ip"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}

resource "yandex_vpc_address" "grafana-ip" {
  name = "grafana-ip"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}


resource "yandex_vpc_address" "kibana-ip" {
  name = "kibana-ip"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
