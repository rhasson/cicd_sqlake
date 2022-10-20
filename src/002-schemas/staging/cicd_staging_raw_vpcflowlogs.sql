/* create staging table for vpc flow logs */
CREATE TABLE default_glue_catalog.cicd.staging_raw_vpcflowlogs
  PARTITIONED BY $event_date
  COMPUTE_CLUSTER = "Default Compute"
;