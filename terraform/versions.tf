terraform {
  required_version = "~> 1.2.6"
  required_providers {
    google = {
      version = "~> 4.30.0"
    }
    google-beta = {
      version = "~> 4.30.0"
    }
    random = {
      version = "~> 3.3.2"
    }
  }
}
