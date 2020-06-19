terraform {
    backend "gcs" {
        bucket = "brightinsight-demo-tfstate"
    }
}

provider "kubernetes" {
}