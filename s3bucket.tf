resource "aws_s3_bucket" "Mybucket1" {
  bucket = var.bucket1
  depends_on = [
    aws_vpc.myvpc
  ]

}
resource "aws_s3_bucket" "Mybucket2" {
  bucket = var.bucket2
  depends_on = [
    aws_s3_bucket.Mybucket1
  ]

}
