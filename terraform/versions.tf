terraform {
  required_version = "~> 1.5.0"
  required_providers {
    google = {
      version = "~> 5.7.0"
    }
    google-beta = {
      version = "~> 5.7.0"
    }
    random = {
      version = "~> 3.5.0"
    }
  }
}
