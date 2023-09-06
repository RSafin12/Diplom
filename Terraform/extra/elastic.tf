### ELASTIC 
resource "yandex_compute_instance" "elastic" {

  name                      = "elastic"
  folder_id                 = "b1girn5e48rhg9v8v5ja"
  hostname                  = "elastic"
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

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    ssh-keys = "<имя_пользователя>:<содержимое_SSH-ключа>"
  }

# Временно включу прерываемость ВМ, только на время тестов
  scheduling_policy {
    preemptible = true
  }

}