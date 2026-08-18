terraform {
  required_version = "~> 1.12.0"
  required_providers {
    google = {
      version = "~> 6.47.0"
    }
    google-beta = {
      version = "~> 7.45.0"
    }
    random = {
      version = "~> 3.7.0"
    }
  }
}
