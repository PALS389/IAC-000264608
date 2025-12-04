terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "hola_mundo" {
  bucket = "iac-hola-mundo-pals-1234" # CAMBIA esto a un nombre único
}

resource "aws_s3_bucket_website_configuration" "sitio" {
  bucket = aws_s3_bucket.hola_mundo.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.hola_mundo.bucket
  key          = "index.html"
  content_type = "text/html"
  content      = "<h1>Hola mundo desde S3 GAAAAAAA</h1>"
}