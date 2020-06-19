provider "google" {
  project = "bright-demo"
  region  = "us-east2"
}

resource "google_project" "project" {
  name            = "bright-demo"
  project_id      = "brihgt-demo"
  billing_account = "0188B8-A16133-54DE4F"
  org_id          = "496293321872"
}