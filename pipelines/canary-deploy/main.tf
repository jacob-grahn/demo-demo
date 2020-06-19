terraform {
    backend "gcs" {
        project = "brightinsight-demo"
        bucket = "brightinsight-demo-tfstate"
    }
}

provider "kubernetes" {
}