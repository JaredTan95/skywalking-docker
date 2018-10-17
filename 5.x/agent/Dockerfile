FROM alpine:3.8 AS sky-builder

ENV SKYWALKING_VERSION=5.0.0-GA

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz  /

RUN tar -zxvf /apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz

FROM java:openjdk-8u111-jre

LABEL maintainer="jian.tan@daocloud.io"

COPY --from=sky-builder /apache-skywalking-apm-incubating/agent /apache-skywalking-apm-incubating/agent


# agent locations in /apache-skywalking-apm-incubating/agent folder.
