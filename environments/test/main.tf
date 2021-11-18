provider "aws" {

  region = "eu-west-2"
}

module "webserver" {
  source = "../../modules/webserver"
}