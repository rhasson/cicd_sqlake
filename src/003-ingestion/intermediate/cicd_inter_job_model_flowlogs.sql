/* create a job to model and transform the raw events */
CREATE JOB load_vpcflowlogs
    COMPUTE_CLUSTER = "Default Compute"
    START_FROM = NOW
    ADD_MISSING_COLUMNS = TRUE
    AS INSERT INTO default_glue_catalog.cicd.inter_model_flowlogs
    MAP_COLUMNS_BY_NAME
    SELECT 
      account_id AS source_account_id,
      action,
      bytes AS bytes_sent,
      srcaddr AS source_ip_address,
      srcport AS source_port,
      dstaddr AS destination_ip_address,
      dstport AS destination_port,
      FROM_UNIXTIME("start"::bigint) AS first_packet_received_time,
      FROM_UNIXTIME("end"::bigint) AS last_packet_received_time,
      interface_id,
      log_status,
      packets AS num_packets_transferred,
      protocol,
      version AS flowlogs_version,
      DATE(FROM_UNIXTIME("start"::bigint)) as dt
    FROM default_glue_catalog.cicd.staging_raw_vpcflowlogs
    WHERE $commit_time between run_start_time() AND run_end_time();