FROM alpine:3.8 AS sky-builder

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/5.0.0-beta2/apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz /

RUN tar -zxvf /apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz

FROM java:openjdk-8u111-jre

ENV ES_CLUSTER_NAME=elasticsearch \
    ES_ADDRESSES=localhost:9300 \
    BIND_HOST=0.0.0.0  \
    NAMING_BIND_HOST=0.0.0.0 \
    NAMING_BIND_PORT=10800 \
    REMOTE_BIND_PORT=11800 \
    AGENT_GRPC_BIND_PORT=11800 \
    AGENT_JETTY_BIND_HOST=0.0.0.0 \
    AGENT_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_HOST=0.0.0.0

COPY --from=sky-builder /apache-skywalking-apm-incubating /apache-skywalking-apm-incubating

COPY application.yml /apache-skywalking-apm-incubating/config/application.yml

COPY docker-entrypoint.sh /docker-entrypoint.sh

# logs locations in /sky/logs folder.

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime \
    && echo 'Asia/Shanghai' >/etc/timezone \
    && chmod +x /docker-entrypoint.sh \
    && chmod +x /apache-skywalking-apm-incubating/bin/startup.sh \
    && echo "tail -f /dev/null" >> /apache-skywalking-apm-incubating/bin/startup.sh \
    && rm -rf /apache-skywalking-apm-incubating/agent

EXPOSE 8080 10800 11800 12800

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/apache-skywalking-apm-incubating/bin/startup.sh"]
