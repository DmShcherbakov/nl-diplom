terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "dmshch-diplom-bucket"
    region     = "ru-central1-a"
    key        = "tfstate/dmshch-diplom.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    access_key = "________"
    secret_key = "________"
  }


}

provider "yandex" {
  cloud_id  = "b1go70qkg5aqrl1gbc1t"
  folder_id = "b1gu5c1jc9ek8u06rino"
  zone      = "ru-central1-a"
  service_account_key_file = "/home/dimka/secrets/key.json"
}

