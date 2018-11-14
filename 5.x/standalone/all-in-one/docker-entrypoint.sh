#!/bin/sh

application_config_path="/apache-skywalking-apm-incubating/config/application.yml"

webapp_config_path="/apache-skywalking-apm-incubating/webapp/webapp.yml"

echo "replace {ES_CLUSTER_NAME} to ${ES_CLUSTER_NAME}"
eval sed -i -e 's/\{ES_CLUSTER_NAME\}/${ES_CLUSTER_NAME}/' ${absolute_path}

echo "replace {ES_ADDRESSES} to ${ES_ADDRESSES}"
eval sed -i -e 's/\{ES_ADDRESSES\}/${ES_ADDRESSES}/' ${absolute_path}

echo "replace {BIND_HOST} to ${DCE_ADVERTISE_IP}"
eval sed -i -e 's/\{BIND_HOST\}/${DCE_ADVERTISE_IP}/' ${absolute_path}

echo "replace {NAMING_BIND_HOST} to ${NAMING_BIND_HOST}"
eval sed -i -e 's/\{NAMING_BIND_HOST\}/${NAMING_BIND_HOST}/' ${absolute_path}

echo "replace {NAMING_BIND_PORT} to ${NAMING_BIND_PORT}"
eval sed -i -e 's/\{NAMING_BIND_PORT\}/${NAMING_BIND_PORT}/' ${absolute_path}

echo "replace {REMOTE_BIND_PORT} to ${REMOTE_BIND_PORT}"
eval sed -i -e 's/\{REMOTE_BIND_PORT\}/${REMOTE_BIND_PORT}/' ${absolute_path}

echo "replace {AGENT_GRPC_BIND_PORT} to ${AGENT_GRPC_BIND_PORT}"
eval sed -i -e 's/\{AGENT_GRPC_BIND_PORT\}/${AGENT_GRPC_BIND_PORT}/' ${absolute_path}

echo "replace {AGENT_JETTY_BIND_HOST} to ${AGENT_JETTY_BIND_HOST}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_HOST\}/${AGENT_JETTY_BIND_HOST}/' ${absolute_path}

echo "replace {AGENT_JETTY_BIND_PORT} to ${AGENT_JETTY_BIND_PORT}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_PORT\}/${AGENT_JETTY_BIND_PORT}/' ${absolute_path}

echo "replace {UI_JETTY_BIND_PORT} to ${UI_JETTY_BIND_PORT}"
eval sed -i -e 's/\{UI_JETTY_BIND_PORT\}/${UI_JETTY_BIND_PORT}/' ${absolute_path}

echo "replace {UI_JETTY_BIND_HOST} to ${UI_JETTY_BIND_HOST}"
eval sed -i -e 's/\{UI_JETTY_BIND_HOST\}/${UI_JETTY_BIND_HOST}/' ${absolute_path}

echo "replace {BUFFER_FILE_PATH} to ${BUFFER_FILE_PATH}"
eval sed -i -e 's/\{BUFFER_FILE_PATH\}/${BUFFER_FILE_PATH}/' ${absolute_path}

echo "replace {BUFFER_OFFSET_MAX_FILE_SIZE} to ${BUFFER_OFFSET_MAX_FILE_SIZE}"
eval sed -i -e 's/\{BUFFER_OFFSET_MAX_FILE_SIZE\}/${BUFFER_OFFSET_MAX_FILE_SIZE}/' ${absolute_path}

echo "replace {BUFFER_SEGMENT_MAX_FILE_SIZE} to ${BUFFER_SEGMENT_MAX_FILE_SIZE}"
eval sed -i -e 's/\{BUFFER_SEGMENT_MAX_FILE_SIZE\}/${BUFFER_SEGMENT_MAX_FILE_SIZE}/' ${absolute_path}

echo "replace {BUFFER_FILE_CLEAN_WHEN_RESTART} to ${BUFFER_FILE_CLEAN_WHEN_RESTART}"
eval sed -i -e 's/\{BUFFER_FILE_CLEAN_WHEN_RESTART\}/${BUFFER_FILE_CLEAN_WHEN_RESTART}/' ${absolute_path}

echo "replace {ES_SHARDS_NUMBER} to ${ES_SHARDS_NUMBER}"
eval sed -i -e 's/\{ES_SHARDS_NUMBER\}/${ES_SHARDS_NUMBER}/' ${absolute_path}

echo "replace {ES_REPLICAS_NUMBER} to ${ES_REPLICAS_NUMBER}"
eval sed -i -e 's/\{ES_REPLICAS_NUMBER\}/${ES_REPLICAS_NUMBER}/' ${absolute_path}

echo "replace {ES_BULK_ACTIONS} to ${ES_BULK_ACTIONS}"
eval sed -i -e 's/\{ES_BULK_ACTIONS\}/${ES_BULK_ACTIONS}/' ${absolute_path}

echo "replace {ES_BULK_SIZE} to ${ES_BULK_SIZE}"
eval sed -i -e 's/\{ES_BULK_SIZE\}/${ES_BULK_SIZE}/' ${absolute_path}

echo "replace {ES_FLUSH_INTERVAL} to ${ES_FLUSH_INTERVAL}"
eval sed -i -e 's/\{ES_FLUSH_INTERVAL\}/${ES_FLUSH_INTERVAL}/' ${absolute_path}

echo "replace {ES_CONCURRENT_REQUESTS} to ${ES_CONCURRENT_REQUESTS}"
eval sed -i -e 's/\{ES_CONCURRENT_REQUESTS\}/${ES_CONCURRENT_REQUESTS}/' ${absolute_path}

echo "replace {ES_HIGH_PERFORMANCE_MODE} to ${ES_HIGH_PERFORMANCE_MODE}"
eval sed -i -e 's/\{ES_HIGH_PERFORMANCE_MODE\}/${ES_HIGH_PERFORMANCE_MODE}/' ${absolute_path}

echo "replace {TRACE_DATA_TTL} to ${TRACE_DATA_TTL}"
eval sed -i -e 's/\{TRACE_DATA_TTL\}/${TRACE_DATA_TTL}/' ${absolute_path}

echo "replace {MINUTE_METRIC_DATA_TTL} to ${MINUTE_METRIC_DATA_TTL}"
eval sed -i -e 's/\{MINUTE_METRIC_DATA_TTL\}/${MINUTE_METRIC_DATA_TTL}/' ${absolute_path}

echo "replace {HOUR_METRIC_DATA_TTL} to ${HOUR_METRIC_DATA_TTL}"
eval sed -i -e 's/\{HOUR_METRIC_DATA_TTL\}/${HOUR_METRIC_DATA_TTL}/' ${absolute_path}

echo "replace {DAY_METRIC_DATA_TTL} to ${DAY_METRIC_DATA_TTL}"
eval sed -i -e 's/\{DAY_METRIC_DATA_TTL\}/${DAY_METRIC_DATA_TTL}/' ${absolute_path}

echo "replace {MONTH_METRIC_DATA_TTL} to ${MONTH_METRIC_DATA_TTL}"
eval sed -i -e 's/\{DAY_METRIC_DATA_TTL\}/${MONTH_METRIC_DATA_TTL}/' ${absolute_path}

echo "replace {THRESHOLD_APPLICATION_APDEX} to ${THRESHOLD_APPLICATION_APDEX}"
eval sed -i -e 's/\{THRESHOLD_APPLICATION_APDEX\}/${THRESHOLD_APPLICATION_APDEX}/' ${absolute_path}

echo "replace {THRESHOLD_SERVICE_ERROR_RATE} to ${THRESHOLD_SERVICE_ERROR_RATE}"
eval sed -i -e 's/\{THRESHOLD_SERVICE_ERROR_RATE\}/${THRESHOLD_SERVICE_ERROR_RATE}/' ${absolute_path}

echo "replace {THRESHOLD_SERVICE_AVG_RESPONSE_TIME} to ${THRESHOLD_SERVICE_AVG_RESPONSE_TIME}"
eval sed -i -e 's/\{THRESHOLD_SERVICE_AVG_RESPONSE_TIME\}/${THRESHOLD_SERVICE_AVG_RESPONSE_TIME}/' ${absolute_path}

echo "replace {THRESHOLD_INSTANCE_ERROR_RATE} to ${THRESHOLD_INSTANCE_ERROR_RATE}"
eval sed -i -e 's/\{THRESHOLD_INSTANCE_ERROR_RATE\}/${THRESHOLD_INSTANCE_ERROR_RATE}/' ${absolute_path}

echo "replace {THRESHOLD_INSTANCE_AVG_RESPONSE_TIME} to ${THRESHOLD_INSTANCE_AVG_RESPONSE_TIME}"
eval sed -i -e 's/\{THRESHOLD_INSTANCE_AVG_RESPONSE_TIME\}/${THRESHOLD_INSTANCE_AVG_RESPONSE_TIME}/' ${absolute_path}

echo "replace {THRESHOLD_APPLICATION_ERROR_RATE} to ${THRESHOLD_APPLICATION_ERROR_RATE}"
eval sed -i -e 's/\{THRESHOLD_APPLICATION_ERROR_RATE\}/${THRESHOLD_APPLICATION_ERROR_RATE}/' ${absolute_path}

echo "replace {THRESHOLD_APPLICATION_AVG_RESPONSE_TIME} to ${THRESHOLD_APPLICATION_AVG_RESPONSE_TIME}"
eval sed -i -e 's/\{THRESHOLD_APPLICATION_AVG_RESPONSE_TIME\}/${THRESHOLD_APPLICATION_AVG_RESPONSE_TIME}/' ${absolute_path}

echo "replace {THERMODYNAMIC_RESPONSE_TIME} to ${THERMODYNAMIC_RESPONSE_TIME}"
eval sed -i -e 's/\{THERMODYNAMIC_RESPONSE_TIME\}/${THERMODYNAMIC_RESPONSE_TIME}/' ${absolute_path}

echo "replace {THERMODYNAMIC_COUNT_OF_RESPONSE_TIME} to ${THERMODYNAMIC_COUNT_OF_RESPONSE_TIME}"
eval sed -i -e 's/\{THERMODYNAMIC_COUNT_OF_RESPONSE_TIME\}/${THERMODYNAMIC_COUNT_OF_RESPONSE_TIME}/' ${absolute_path}

echo "replace {WORKER_CACHE_MAX_SIZE} to ${WORKER_CACHE_MAX_SIZE}"
eval sed -i -e 's/\{WORKER_CACHE_MAX_SIZE\}/${WORKER_CACHE_MAX_SIZE}/' ${absolute_path}

exec "$@"
