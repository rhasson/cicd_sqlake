/* create a job to aggregate the connection stats */
CREATE JOB data_app_conn_stats_job
    COMPUTE_CLUSTER = "Default Compute"
    START_FROM = NOW
    ADD_MISSING_COLUMNS = TRUE
    AS INSERT INTO default_glue_catalog.cicd.data_app_conn_stats
    MAP_COLUMNS_BY_NAME
    SELECT 
      dt,
      source_ip_address,
      destination_port,
      sum(num_packets_transferred::bigint) AS total_packets_sent,
      sum(bytes_sent::bigint) AS total_bytes_sent,
      sum(date_diff('second',  first_packet_received_time, last_packet_received_time)) AS connection_length_sec
    FROM default_glue_catalog.cicd.inter_model_flowlogs 
    WHERE
      log_status = 'OK'
      AND action = 'ACCEPT'
      AND $commit_time BETWEEN run_start_time() AND run_end_time();
    GROUP BY 1,2,3