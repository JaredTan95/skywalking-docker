FROM docker.elastic.co/elasticsearch/elasticsearch:5.6.10

LABEL maintainer="jian.tan@daocloud.io"

USER root

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && chown elasticsearch:elasticsearch config/elasticsearch.yml

USER elasticsearch
