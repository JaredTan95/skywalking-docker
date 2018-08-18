# Skywalking-Docker
通过Apache-skywalking官方发布的[压缩包](https://skywalking.incubator.apache.org/)构建Docker镜像。提供一键启动单机演示版Skywalking的方式。

- [![GitHub stars](https://img.shields.io/github/stars/JaredTan95/skywalking-docker.svg?style=for-the-badge&label=Stars&logo=github)](https://github.com/JaredTan95/skywalking-docker)
- [![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)
- [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/):[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)
- [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/):[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/)
- [![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/builds/)
- [![ImageLayers Size](https://img.shields.io/imagelayers/image-size/wutang/skywalking-docker/latest.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)
- [![ImageLayers Layers](https://img.shields.io/imagelayers/layers/wutang/skywalking-docker/latest.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)

[Apache-skywalking官方源码](https://github.com/apache/incubator-skywalking/)

## 目录结构

- 5.x Skywalking 单机快速部署镜像源文件：
	- standalone/all-in-one:用于自动构建[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) Docker镜像。
	- standalone/collector:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/) Docker镜像，该镜像用于部署单机Skywalking Collector。
	- cluster/collector:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/):xx-zk 镜像，该镜像用于通过Zookeeper实现集群部署Skywalking Collector。
	- quick-start:通过Docker stack或者Docker Compose快速启动Skywalking，其中包含启动[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) 和[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)两个容器。
- elasticsearch-5.6.10-Zone-Asia-SH 同步上海时区的Elasticsearch镜像源文件：
	- 用于自动构建[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) Docker镜像。

## 如何使用（Usage）


### 方式一、直接拉取镜像运行
- [wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)镜像[使用说明](elasticsearch-5.6.10-Zone-Asia-SH/README.md)
- [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)镜像[使用说明](5.x/standalone/all-in-one/README.md)
- Docker Compose[使用说明](../5.x/quick-start/README.md)

### 方式二、通过源码构建镜像

#### 构建Skyealking镜像
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```Elasticsearch安装(如果已安装可跳过此步骤)，版本要求5.x：docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -e xpack.security.enabled=false -d wutang/elasticsearch-shanghai-zone```
- ```cd /skywalking-docker/5.x/standalone/all-in-one/```
- ```docker build -t skywalking:5.0.0 .```
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d skywalking:5.0.0```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/apache-skywalking-apm-incubating/logs```

#### 构建Elasticsearch镜像
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```cd /skywalking-docker/5.x/standalone/elasticsearch-5.6.10-Zone-Asia-SH```
- ```docker build -t es-sh:5.6.10 .```

### Docker Compose
version: '2'
services:
  elasticsearch-service:
    image: wutang/elasticsearch-shanghai-zone
    container_name: elasticsearch
    environment:
      - cluster.name=elasticsearch
      - bootstrap.memory_lock=true
      - xpack.security.enabled=false
      - "ES_JAVA_OPTS=-Xms2g -Xmx2g"
      - node.name=elasticsearch_node_1
    ulimits:
      memlock:
        soft: -1
        hard: -1
    ports:
      - 9200:9200
      - 9300:9300
  
  skywalking:
    image: wutang/skywalking-docker:5.x
    container_name: skywalking
    environment:
      - ES_CLUSTER_NAME=elasticsearch
      - ES_ADDRESSES=elasticsearch-service:9300
      - BIND_HOST=skywalking
      - AGENT_JETTY_BIND_HOST=skywalking
      - NAMING_BIND_HOST=skywalking
      - UI_JETTY_BIND_HOST=0.0.0.0
    depends_on:
      - elasticsearch-service
    links:
      - elasticsearch-service
    ports:
      - 8080:8080
      - 10800:10800
      - 11800:11800
      - 12800:12800

### 联系作者
<img src="http://oosk9q3p6.bkt.clouddn.com/wechatTJ.png" style="width=200px;height=200px;" />
