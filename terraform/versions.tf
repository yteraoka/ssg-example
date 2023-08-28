terraform {
  required_version = "~> 1.5.0"
  required_providers {
    google = {
      version = "~> 4.80.0"
    }
    google-beta = {
      version = "~> 4.80.0"
    }
    random = {
      version = "~> 3.5.0"
    }
  }
}
