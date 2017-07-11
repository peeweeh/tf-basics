# setup aws provider for main account
provider "aws" {
    alias = "provider"
    region = "${var.provider_region}"
    access_key = "${var.provider_access}"
    secret_key = "${var.provider_secret}"
}

# setup aws provider for main account
provider "aws" {
    alias = "managed"
    region = "${var.managed_region}"
    access_key = "${var.managed_access}"
    secret_key = "${var.managed_secret}"
}