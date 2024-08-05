terraform {
  required_version = "~> 1.6.0"
  required_providers {
    google = {
      version = "~> 5.40.0"
    }
    google-beta = {
      version = "~> 5.40.0"
    }
    random = {
      version = "~> 3.6.0"
    }
  }
}
