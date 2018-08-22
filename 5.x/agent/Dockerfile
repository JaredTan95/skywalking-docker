FROM alpine:3.8 AS sky-builder

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/5.0.0-beta2/apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz /

RUN tar -zxvf /apache-skywalking-apm-incubating-5.0.0-beta2.tar.gz

FROM java:openjdk-8u111-jre

LABEL maintainer="jian.tan@daocloud.io"

COPY --from=sky-builder /apache-skywalking-apm-incubating/agent /apache-skywalking-apm-incubating/agent


# logs locations in /sky/logs folder.
