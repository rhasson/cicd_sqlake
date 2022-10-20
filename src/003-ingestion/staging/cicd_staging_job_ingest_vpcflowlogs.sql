/* create ingestion job to stage VPC flow logs */
create job staging_job_ingest_vpcflowlogs
  compute_cluster = "Default Compute"
  start_from = beginning
  date_pattern = 'yyyy/MM/dd/HH/mm'
  content_type = parquet
  as copy from s3 logs_bucket_conn
    bucket = 'dbxflowlog'
    prefix = 'AWSLogs/433987883887/vpcflowlogs/us-east-1'
  into default_glue_catalog.cicd.staging_raw_vpcflowlogs
;