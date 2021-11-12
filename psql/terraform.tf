variable region {
  default = "southamerica-east1"
}

variable network {
  default = "default"
}

variable zone {
  default = "southamerica-east1-a"
}
resource "random_id" "name" {
  byte_length = 2
}

provider google {
  region = "${var.region}"
}

module "postgresql-db" {
  source           = "github.com/GoogleCloudPlatform/terraform-google-sql-db"
  name             = "example-postgresql-${random_id.name.hex}"
  user_host        = ""
  database_version = "POSTGRES_9_6"
}