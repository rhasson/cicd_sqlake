CREATE TABLE default_glue_catalog.cicd.inter_model_flowlogs(
    source_account_id string,
    action string,
    bytes_sent string,
    source_ip_address string,
    source_port string,
    destination_ip_address string,
    destination_port string,
    first_packet_received_time timestamp,
    last_packet_received_time timestamp,
    interface_id string,
    log_status string,
    num_packets_transferred bigint,
    protocol double,
    flowlogs_version string,
    dt timestamp
)
PARTITIONED BY dt
TABLE_DATA_RETENTION = 5 DAYS
COMPUTE_CLUSTER = "Default Compute";