# Skywalking-Dcoker 镜像

[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)


Docker 镜像名称:[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)

## 拉取镜像（Pull Image）:
```docker pull wutang/skywalking-docker```

## 运行镜像（Run）:
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d wutang/skywalking-docker:latest```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/apache-skywalking-apm-incubating/logs```

## 环境变量（Environment Variables）
ES_CLUSTER_NAME=elasticsearch \
    ES_CLUSTER_SNIFFER=true \
    ES_ADDRESSES=localhost:9300 \
    BIND_HOST=0.0.0.0  \
    NAMING_BIND_HOST=0.0.0.0 \
    NAMING_BIND_PORT=10800 \
    REMOTE_BIND_PORT=11800 \
    AGENT_GRPC_BIND_PORT=11800 \
    AGENT_JETTY_BIND_HOST=0.0.0.0 \
    AGENT_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_PORT=12800 \
    UI_JETTY_BIND_HOST=0.0.0.0 \
    UI_SERVER_PORT=8080 \
    UI_ADMIN_PASSWORD=admin \
    UI_RIBBON_LIST_SERVERS=127.0.0.1:10800
- ```ES_CLUSTER_NAME```,```ES_ADDRESSES```:elasticsearch 地址和集群名称。注意：此处Elasticsearch地址中的端口务必是Elasticsearch TCP端口。
- ```NAMING_BIND_HOST```,```NAMING_BIND_PORT```:OS real network IP(binding required),for agent to find collector cluster.
- ```BIND_HOST```,```REMOTE_BIND_PORT```:OS real network IP(binding required),for collector nodes communicate with each other in cluster. collectorN --(gRPC) --> collectorM
- ```AGENT_GRPC_BIND_PORT```:OS real network IP(binding required),for agent to uplink data(trace/metrics) to collector. agent--(gRPC)--> collector
- ```AGENT_JETTY_BIND_HOST```,```AGENT_JETTY_BIND_PORT```:OS real network IP(binding required), for agent to uplink data(trace/metrics) to collector through HTTP. agent--(HTTP)--> collector
- ```UI_ADMIN_PASSWORD```:UI界面中管理员‘admin’的登录密码。
-```UI_JETTY_BIND_HOST```,```UI_JETTY_BIND_PORT```:Stay in `0.0.0.0` if UI starts up in default mode.Change it to OS real network IP(binding required), if deploy collector in different machine.


## 与elasticsearch-shanghai-zone镜像配合使用请参考
- [wutang/elasticsearch-shanghai-zone](https://github.com/JaredTan95/skywalking-docker/blob/master/elasticsearch-5.6.10-Zone-Asia-SH/README.md)
- [quick start](https://github.com/JaredTan95/skywalking-docker/blob/master/5.x/quick-start/README.md)


