# Skywalking-Docker
通过Apache-skywalking官方发布的[压缩包](https://skywalking.incubator.apache.org/)构建Docker镜像。提供一键启动单机演示版Skywalking的方式。

[![GitHub stars](https://img.shields.io/github/stars/JaredTan95/skywalking-docker.svg?style=for-the-badge&label=Stars&logo=github)](https://github.com/JaredTan95/skywalking-docker)

[Apache-skywalking官方源码](https://github.com/apache/incubator-skywalking/)

## 目录结构

- 5.x Skywalking 单机快速部署镜像源文件：
	- 用于自动构建[wutang/elasticsearch-shanghai-zone ](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)Docker镜像。
- elasticsearch-5.6.10-Zone-Asia-SH 同步上海时区的Elasticsearch镜像源文件：
	- 用于自动构建[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) Docker镜像。

## Usage
### 直接拉取镜像运行
- 镜像地址：[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)
- 运行：```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d wutang/skywalking-docker:latest```
- 使用浏览器访问```http://localhost:8080```即可.

### 通过源码构建镜像

#### 构建Skyealking镜像
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```Elasticsearch安装(如果已安装可跳过此步骤)，版本要求5.x：docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -e xpack.security.enabled=false -d wutang/elasticsearch-shanghai-zone```
- ```cd /skywalking-docker/5.x/standalone```
- ```docker build -t skywalking:5.0.0 .```
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d skywalking:5.0.0```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/sky/logs```

#### 构建Elasticsearch镜像
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```cd /skywalking-docker/5.x/standalone/elasticsearch-5.6.10-Zone-Asia-SH```
- ```docker build -t es-sh:5.6.10 .```

### Docker Compose Quick-Start
其中引用了[wutang/elasticsearch-shanghai-zone ](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)镜像和[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) 镜像

- ```cd /skywalking-docker/5.x/quick-start/```
- ```docker-compose up docker-compose-v2.yml```

```

version: '2'
services:
  elasticsearch-service:
    image: docker.elastic.co/elasticsearch/elasticsearch:5.6.10
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

```
