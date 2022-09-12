terraform {
  required_version = "~> 1.2.6"
  required_providers {
    google = {
      version = "~> 4.36.0"
    }
    google-beta = {
      version = "~> 4.34.0"
    }
    random = {
      version = "~> 3.4.0"
    }
  }
}
