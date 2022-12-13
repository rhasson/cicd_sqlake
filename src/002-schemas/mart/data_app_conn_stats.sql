/* table to hold the IP connection stats as a standalone data app */
CREATE TABLE default_glue_catalog.cicd.data_app_conn_stats (
    dt date,
    source_ip_address string,
    destination_port bigint,
    total_packets_sent bigint,
    total_bytes_sent bigint,
    connection_length_sec bigint
)
PARTITIONED BY dt
TABLE_DATA_RETENTION = 3 DAYS
COMPUTE_CLUSTER = "Default Compute";