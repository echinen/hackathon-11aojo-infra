resource "aws_s3_bucket" "hackaton-11aojo-emc" {
  bucket = "hackaton-11aojo-emc"

  acl    = "public-read"  # Define a acl para public-read

  website {
    index_document = "index.html"
  }
  
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::hackaton-11aojo-emc/*"
    }
  ]
}
POLICY
}
