# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM alpine:3.8 AS sky-builder

ENV SKYWALKING_VERSION=6.0.0-beta

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/incubator/skywalking/${SKYWALKING_VERSION}/apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz  /

RUN tar -zxvf /apache-skywalking-apm-incubating-${SKYWALKING_VERSION}.tar.gz

FROM openjdk:8-jre-alpine

LABEL maintainer="jian.tan@daocloud.io"

COPY --from=sky-builder /apache-skywalking-apm-incubating /

ENV DIST_NAME=apache-skywalking-apm-incubating \
    JAVA_OPTS=" -Xms512M -Xmx1024M"

# Install required packages
RUN apk add --no-cache \
    bash

# logs locations in /sky/logs folder.
RUN set -ex; \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime; \
    echo 'Asia/Shanghai' > /etc/timezone; \
    rm -rf "$DIST_NAME.tar.gz"; rm -rf "$DIST_NAME/config"; \
    rm -rf "$DIST_NAME/bin"; rm -rf "$DIST_NAME/oap-libs"; rm -rf "$DIST_NAME/agent";

WORKDIR $DIST_NAME

COPY docker-entrypoint.sh .
COPY logback.xml webapp/

EXPOSE 12800 11800

ENTRYPOINT ["sh", "docker-entrypoint.sh"]