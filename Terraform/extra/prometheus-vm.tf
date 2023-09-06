### PROMETHEUS 1 
resource "yandex_compute_instance" "prometheus-1" {

  name                      = "prometheus-1"
  folder_id                 = "b1girn5e48rhg9v8v5ja"
  hostname                  = "prometheus-1"
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

### PROMETHEUS 2
resource "yandex_compute_instance" "prometheus-2" {

  name                      = "prometheus-2"
  folder_id                 = "b1girn5e48rhg9v8v5ja"
  hostname                  = "prometheus-2"
  allow_stopping_for_update = true
  platform_id               = "standard-v2"
  zone                      = "ru-central1-B"

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
    subnet_id = yandex_vpc_subnet.subnet-2.id
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