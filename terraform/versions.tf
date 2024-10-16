terraform {
  required_version = "~> 1.9.0"
  required_providers {
    google = {
      version = "~> 5.8.0"
    }
    google-beta = {
      version = "~> 5.8.0"
    }
    random = {
      version = "~> 3.6.0"
    }
  }
}
