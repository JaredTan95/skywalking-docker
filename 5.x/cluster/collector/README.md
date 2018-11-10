# skywalking-collector
[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/) 
[![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/)
[![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/builds/)

Docker 镜像名称:[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/)

此镜像主要提供了Skywalking Collector服务的镜像，该镜像包含单机版和集群版的Collector收集器，通过此镜像部署Collector集群需要Zookeeper的支持。在启动是通过`ZK_ADDRESSES=127.0.0.1:2181,...,127.0.0.1:2182`传入Zookeeper集群地址。

## 拉取镜像（Pull Image）:
- 单机版Collector
```docker pull wutang/skywalking-collector:5.x```或者```docker pull wutang/skywalking-collector```

- 集群版Collector
```docker pull wutang/skywalking-collector:5.x-zk```或者```docker pull wutang/skywalking-collector:latest-zk```

## 运行镜像（Run）:
- 单机版Collctor

### 主机模式启动（Host Mode）：
```
docker run --net=host \
-m 2048m --memory-swap 2400m \
-e DAE_SEGMENT="^127\.0\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
-d wutang/skywalking-collector:5.x
```

### 端口映射模式启动（Port-Mapping Mode）
```
docker run -p 10800:10800 -p 11800:11800 -p 12800:12800 \
-m 2048m --memory-swap 2400m \
-e DAE_SEGMENT="^172\.17\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
-d wutang/skywalking-collector:5.x
```

- 集群版Collctor
	- 注意：请确保Zookeeper集群已经处于运行状态，可参考[Zookeeper部署](https://hub.docker.com/_/zookeeper/)
```
docker run --net=host \
-m 2048m --memory-swap 2400m \
-e ZK_ADDRESSES=127.0.0.1:2181,127.0.0.1:2182 \
-e DAE_SEGMENT="^127\.0\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
-d wutang/skywalking-collector:5.x
```

### 端口映射模式启动（Port-Mapping Mode）
```
docker run -p 10800:10800 -p 11800:11800 -p 12800:12800 \
-m 2048m --memory-swap 2400m \
-e ZK_ADDRESSES=127.0.0.1:2181,127.0.0.1:2182 \
-e DAE_SEGMENT="^172\.17\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
-d wutang/skywalking-collector:5.x
```

## 环境变量（Environment Variables）
- ```DAE_SEGMENT```:容器会根据该正则表达式所匹配到的IP进行绑定。
- ```ES_CLUSTER_NAME```,```ES_ADDRESSES```:elasticsearch 地址和集群名称。注意：此处Elasticsearch地址中的端口务必是Elasticsearch TCP端口（9300）。

## Skywalking-Docker镜像配合使用请参考
- [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)镜像[使用说明](https://github.com/JaredTan95/skywalking-docker/blob/master/5.x/standalone/all-in-one/README.md)
- [quick start](https://github.com/JaredTan95/skywalking-docker/blob/master/5.x/quick-start/README.md)




