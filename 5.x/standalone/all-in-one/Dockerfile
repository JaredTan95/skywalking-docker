FROM alpine:3.8 AS sky-builder

ENV SKYWALKING_VERSION=5.0.0-GA

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz  /

RUN tar -zxvf /apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz

FROM java:openjdk-8u111-jre

LABEL maintainer="jian.tan@daocloud.io"

ENV ES_CLUSTER_NAME=elasticsearch \
    ES_ADDRESSES=127.0.0.1:9300 \
    BIND_HOST=0.0.0.0  \
    NAMING_BIND_HOST=0.0.0.0 \
    NAMING_BIND_PORT=10800 \
    REMOTE_BIND_PORT=11800 \
    AGENT_GRPC_BIND_PORT=11800 \
    AGENT_JETTY_BIND_HOST=localhost \
    AGENT_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_HOST=0.0.0.0 \
    BUFFER_OFFSET_MAX_FILE_SIZE=10M \
    BUFFER_SEGMENT_MAX_FILE_SIZE=50M \
    BUFFER_FILE_CLEAN_WHEN_RESTART=true \
    ES_SHARDS_NUMBER=2 \
    ES_REPLICAS_NUMBER=0 \
    ES_BULK_ACTIONS=2000 \
    ES_FLUSH_INTERVAL=10 \
    ES_CONCURRENT_REQUESTS=2 \
    ES_HIGH_PERFORMANCE_MODE=true \
    ES_BULK_SIZE=20 \
    TRACE_DATA_TTL=90 \
    MINUTE_METRIC_DATA_TTL=90 \
    HOUR_METRIC_DATA_TTL=36 \
    DAY_METRIC_DATA_TTL=45 \
    MONTH_METRIC_DATA_TTL=18 \
    THRESHOLD_APPLICATION_APDEX=2000 \
    THRESHOLD_SERVICE_ERROR_RATE=10.00 \
    THRESHOLD_SERVICE_AVG_RESPONSE_TIME=2000 \
    THRESHOLD_INSTANCE_ERROR_RATE=10.00 \
    THRESHOLD_INSTANCE_AVG_RESPONSE_TIME=2000 \
    THRESHOLD_APPLICATION_ERROR_RATE=10.00 \
    THRESHOLD_APPLICATION_AVG_RESPONSE_TIME=2000 \
    THERMODYNAMIC_RESPONSE_TIME=50 \
    THERMODYNAMIC_COUNT_OF_RESPONSE_TIME=40 \
    WORKER_CACHE_MAX_SIZE=10000

COPY --from=sky-builder /apache-skywalking-apm-incubating /apache-skywalking-apm-incubating

COPY application.yml /apache-skywalking-apm-incubating/config/application.yml

COPY webapp.yml /apache-skywalking-apm-incubating/webapp/webapp.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

COPY wait-for-it.sh /wait-for-it.sh

# logs locations in /sky/logs folder.
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && echo 'Asia/Shanghai' > /etc/timezone \
    && chmod +x /docker-entrypoint.sh \
    && chmod +x /apache-skywalking-apm-incubating/bin/startup.sh \
    && echo "tail -f -n 300  /apache-skywalking-apm-incubating/logs/skywalking-collector-server.log" >> /apache-skywalking-apm-incubating/bin/startup.sh \
    && rm -rf /apache-skywalking-apm-incubating/agent

EXPOSE 8080 10800 11800 12800

CMD /docker-entrypoint.sh && /apache-skywalking-apm-incubating/bin/startup.sh
