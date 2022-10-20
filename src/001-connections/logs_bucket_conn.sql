/* Create a connection to S3 log bucket */
create s3 connection logs_bucket_conn2
    aws_role = 'arn:aws:iam::433987883887:role/royon_ro_role'
    external_id = 'ROYON'
;