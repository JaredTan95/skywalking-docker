FROM elasticsearch:7.0.1

LABEL maintainer="jian.tan@daocloud.io"

ENV discovery.type=single-node \
    xpack.security.enabled=false \
    cluster.name=elasticsearch \
    bootstrap.memory_lock=true

USER root

COPY elasticsearch.yml /config/elasticsearch.yml

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && chown elasticsearch:elasticsearch config/elasticsearch.yml

USER elasticsearch
