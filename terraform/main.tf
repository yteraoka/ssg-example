module "gh_oidc" {
  source  = "terraform-google-modules/github-actions-runners/google//modules/gh-oidc"
  version = "v3.1.0"

  project_id  = var.project_id
  pool_id     = "ssg-example"
  provider_id = "gh-ssg-example"
  sa_mapping = {
    "ssg-example" = {
      sa_name   = google_service_account.gh_ssg_example.name
      attribute = "attribute.repository/yteraoka/ssg-example"
    }
  }
}

output "oidc_pool_name" {
  value = module.gh_oidc.pool_name
}

output "oidc_provider_name" {
  value = module.gh_oidc.provider_name
}

resource "google_service_account" "gh_ssg_example" {
  account_id   = "gha-ssg-example"
  display_name = "GitHub Actions ssg-example"
}

output "service_account" {
  value = google_service_account.gh_ssg_example.email
}

resource "google_storage_bucket" "ssg_example_prod" {
  name                        = "ssg-example-prod-${random_string.random.id}"
  force_destroy               = true
  location                    = "ASIA-NORTHEAST1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

output "bucket_name_prod" {
  value = google_storage_bucket.ssg_example_prod.name
}

resource "google_storage_bucket" "ssg_example_staging" {
  name                        = "ssg-example-staging-${random_string.random.id}"
  force_destroy               = true
  location                    = "ASIA-NORTHEAST1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

output "bucket_name_staging" {
  value = google_storage_bucket.ssg_example_staging.name
}

resource "google_storage_bucket" "ssg_example_review" {
  name                        = "ssg-example-review-${random_string.random.id}"
  force_destroy               = true
  location                    = "ASIA-NORTHEAST1"
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "index.html"
  }
}

output "bucket_name_review" {
  value = google_storage_bucket.ssg_example_review.name
}

resource "google_storage_bucket_iam_binding" "ssg_example_prod" {
  bucket  = google_storage_bucket.ssg_example_prod.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

resource "google_storage_bucket_iam_binding" "ssg_example_staging" {
  bucket  = google_storage_bucket.ssg_example_staging.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

resource "google_storage_bucket_iam_binding" "ssg_example_review" {
  bucket  = google_storage_bucket.ssg_example_review.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers"]
}

resource "google_storage_bucket_iam_member" "ssg_example_prod_deploy" {
  bucket = google_storage_bucket.ssg_example_prod.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gh_ssg_example.email}"
}

resource "google_storage_bucket_iam_member" "ssg_example_staging_deploy" {
  bucket = google_storage_bucket.ssg_example_staging.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gh_ssg_example.email}"
}

resource "google_storage_bucket_iam_member" "ssg_example_review_deploy" {
  bucket = google_storage_bucket.ssg_example_review.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${google_service_account.gh_ssg_example.email}"
}

resource "random_string" "random" {
  length  = 4
  special = false
  lower   = true
  upper   = false
  numeric = true
}
