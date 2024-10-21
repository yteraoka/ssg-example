terraform {
  required_version = "~> 1.6.0"
  required_providers {
    google = {
      version = "~> 6.8.0"
    }
    google-beta = {
      version = "~> 5.8.0"
    }
    random = {
      version = "~> 3.6.0"
    }
  }
}
