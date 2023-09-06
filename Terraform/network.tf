resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
### Подсеть для webserver-1
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["192.168.10.0/24"]
  network_id     = yandex_vpc_network.network-1.id
}
### Подсеть для webserver-2
resource "yandex_vpc_subnet" "subnet-2" {
  name           = "subnet2"
  zone           = "ru-central1-b"
  v4_cidr_blocks = ["192.168.11.0/24"]
  network_id     = yandex_vpc_network.network-1.id
}
