select count * from default_glue_catalog.cicd.staging_raw_vpcflowlogs;
select count(distinct source_account_id) from default_glue_catalog.cicd.inter_model_flowlogs;
select count(distinct source_ip_address) from default_glue_catalog.cicd.data_app_conn_stats;
select count(distinct destination_port) from default_glue_catalog.cicd.data_app_conn_stats;