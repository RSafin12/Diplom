### PROMETHEUS 1 
resource "yandex_compute_instance" "grafana" {

  name                      = "grafana"
  folder_id                 = "b1girn5e48rhg9v8v5ja"
  hostname                  = "grafana"
  allow_stopping_for_update = true
  platform_id               = "standard-v2"
  zone                      = "ru-central1-a"

  resources {
    cores  = "2"
    core_fraction = "5"
    memory = "1"
  }

  boot_disk {
    initialize_params {
      image_id = "centos-7-v20230724" # https://cloud.yandex.ru/docs/compute/operations/images-with-pre-installed-software/get-list
      size = "10"
      type = "hdd"
    }
  }

  metadata = {
    ssh-keys = "<имя_пользователя>:<содержимое_SSH-ключа>"
  }

# Надо поправить, т.к. Grafana должна иметь белый IP 
  network_interface {
    subnet_id = yandex_vpc_address.grafana-ip.id
  }  

# Временно включу прерываемость ВМ, только на время тестов
  scheduling_policy {
    preemptible = true
  }

}

