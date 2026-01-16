variable "project_id" {}
variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "instance_name" {
  default = "win-sql-dev-vm"
}
variable "machine_type" {
  default = "e2-medium"
}
variable "service_account_email" {}
