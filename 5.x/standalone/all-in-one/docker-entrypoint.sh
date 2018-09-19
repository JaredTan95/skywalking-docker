#!/bin/sh

application_config_path="/apache-skywalking-apm-incubating/config/application.yml"

webapp_config_path="/apache-skywalking-apm-incubating/webapp/webapp.yml"

echo "replace {ES_CLUSTER_NAME} to ${ES_CLUSTER_NAME}"
eval sed -i -e 's/\{ES_CLUSTER_NAME\}/${ES_CLUSTER_NAME}/' ${application_config_path}

echo "replace {ES_CLUSTER_SNIFFER} to ${ES_CLUSTER_SNIFFER}"
eval sed -i -e 's/\{ES_CLUSTER_SNIFFER\}/${ES_CLUSTER_SNIFFER}/' ${application_config_path}

echo "replace {ES_ADDRESSES} to ${ES_ADDRESSES}"
eval sed -i -e 's/\{ES_ADDRESSES\}/${ES_ADDRESSES}/' ${application_config_path}

echo "replace {BIND_HOST} to ${BIND_HOST}"
eval sed -i -e 's/\{BIND_HOST\}/${BIND_HOST}/' ${application_config_path}

echo "replace {NAMING_BIND_HOST} to ${NAMING_BIND_HOST}"
eval sed -i -e 's/\{NAMING_BIND_HOST\}/${NAMING_BIND_HOST}/' ${application_config_path}

echo "replace {NAMING_BIND_PORT} to ${NAMING_BIND_PORT}"
eval sed -i -e 's/\{NAMING_BIND_PORT\}/${NAMING_BIND_PORT}/' ${application_config_path}

echo "replace {REMOTE_BIND_PORT} to ${REMOTE_BIND_PORT}"
eval sed -i -e 's/\{REMOTE_BIND_PORT\}/${REMOTE_BIND_PORT}/' ${application_config_path}

echo "replace {AGENT_GRPC_BIND_PORT} to ${AGENT_GRPC_BIND_PORT}"
eval sed -i -e 's/\{AGENT_GRPC_BIND_PORT\}/${AGENT_GRPC_BIND_PORT}/' ${application_config_path}

echo "replace {AGENT_JETTY_BIND_HOST} to ${AGENT_JETTY_BIND_HOST}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_HOST\}/${AGENT_JETTY_BIND_HOST}/' ${application_config_path}

echo "replace {AGENT_JETTY_BIND_PORT} to ${AGENT_JETTY_BIND_PORT}"
eval sed -i -e 's/\{AGENT_JETTY_BIND_PORT\}/${AGENT_JETTY_BIND_PORT}/' ${application_config_path}

echo "replace {UI_JETTY_BIND_PORT} to ${UI_JETTY_BIND_PORT}"
eval sed -i -e 's/\{UI_JETTY_BIND_PORT\}/${UI_JETTY_BIND_PORT}/' ${application_config_path}

echo "replace {UI_JETTY_BIND_HOST} to ${UI_JETTY_BIND_HOST}"
eval sed -i -e 's/\{UI_JETTY_BIND_HOST\}/${UI_JETTY_BIND_HOST}/' ${application_config_path}

echo "replace {UI_SERVER_PORT} to ${UI_SERVER_PORT}"
eval sed -i -e 's/\{UI_SERVER_PORT\}/${UI_SERVER_PORT}/' ${webapp_config_path}

echo "replace {UI_ADMIN_PASSWORD} to ${UI_ADMIN_PASSWORD}"
eval sed -i -e 's/\{UI_ADMIN_PASSWORD\}/${UI_ADMIN_PASSWORD}/' ${webapp_config_path}

echo "replace {UI_RIBBON_LIST_SERVERS} to ${UI_RIBBON_LIST_SERVERS}"
eval sed -i -e 's/\{UI_RIBBON_LIST_SERVERS\}/${UI_RIBBON_LIST_SERVERS}/' ${webapp_config_path}

exec "$@"
