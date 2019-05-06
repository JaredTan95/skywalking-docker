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

FROM openjdk:8-jre-alpine

LABEL maintainer="jian.tan@daocloud.io"

ENV SKYWALKING_VERSION=6.1.0 \
    TZ=Asia/Shanghai \
    PACKAGE_NAME=apache-skywalking-apm \
    DIST_NAME=apache-skywalking-apm-bin \
    JAVA_OPTS=" -Xms512M -Xmx1024M"

# after ADD unzip does not work?
ADD http://mirrors.tuna.tsinghua.edu.cn/apache/skywalking/${SKYWALKING_VERSION}/${PACKAGE_NAME}-${SKYWALKING_VERSION}.tar.gz  /

# Install required packages
RUN apk add --no-cache \
    bash

# logs locations in /$DIST_NAME/logs folder.
RUN set -ex; \
    ln -sf /usr/share/zoneinfo/$TZ  /etc/localtime; \
    echo $TZ > /etc/timezone; \
    tar -zxvf /${PACKAGE_NAME}-${SKYWALKING_VERSION}.tar.gz; \ 
    rm -rf "${PACKAGE_NAME}-${SKYWALKING_VERSION}.tar.gz"; rm -rf "$DIST_NAME/config/log4j2.xml"; \
    rm -rf "$DIST_NAME/bin"; rm -rf "$DIST_NAME/webapp"; rm -rf "$DIST_NAME/agent";

WORKDIR $DIST_NAME

COPY log4j2.xml config/
COPY docker-entrypoint.sh .

EXPOSE 12800 11800

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
