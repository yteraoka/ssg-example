terraform {
  required_version = "~> 1.2.6"
  required_providers {
    google = {
      version = "~> 4.63.0"
    }
    google-beta = {
      version = "~> 4.63.0"
    }
    random = {
      version = "~> 3.5.0"
    }
  }
}
