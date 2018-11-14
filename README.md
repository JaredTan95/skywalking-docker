# Skywalking-Docker
通过Apache-skywalking官方发布的[压缩包](https://skywalking.incubator.apache.org/)构建Docker镜像。提供一键启动单机演示版Skywalking的方式。

[![GitHub stars](https://img.shields.io/github/stars/JaredTan95/skywalking-docker.svg?style=for-the-badge&label=Stars&logo=github)](https://github.com/JaredTan95/skywalking-docker) [![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/) [![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/builds/)

- [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)
- [wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/)

[Apache-skywalking官方源码](https://github.com/apache/incubator-skywalking/)
## 前置条件（Precondition）
 了解Docker或者使用过Docker相关命令。

## 目录结构（Structure）
- `Skywalking`:`5.x`分支容器部署镜像源文件：
	- `standalone/all-in-one`:用于自动构建[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) Docker镜像。
	- `standalone/all-in-one-xpack`:用于构建支持Elastic xpack账号密码登录的skywalking,常见阿里云ES,代码源由[liguobao/incubator-skywalking](https://github.com/liguobao/incubator-skywalking)基于incubator-skywalking 官方源码修改而来。
	- `standalone/collector`:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/) Docker镜像，该镜像用于部署单机Skywalking Collector。
	- `cluster/collector`:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/):5.x-zk 镜像，该镜像用于通过Zookeeper实现集群部署Skywalking Collector。
	- `quick-start`:通过Docker stack或者Docker Compose快速启动Skywalking，其中包含启动[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) 和[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)两个容器。
- `elasticsearch-5.6.10-Zone-Asia-SH`:同步上海时区的Elasticsearch镜像源文件：
	- 用于自动构建[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) Docker镜像。

## 如何使用（Usage）


### 方式一、直接拉取镜像运行(Pull Image)
#### 启动ElasticSearch容器
- [wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)镜像[使用说明](elasticsearch-Zone-Asia-SH/README.md)

#### 启动Skywalking容器
- [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)镜像[使用说明](5.x/standalone/all-in-one/README.md)
- Docker Compose[使用说明](../5.x/quick-start/README.md)

### 方式二、通过源码构建镜像(Build Image)

#### 构建Skywalking镜像(Build Skywalking Image)
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```Elasticsearch安装(如果已安装可跳过此步骤)，版本要求5.x：docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -e xpack.security.enabled=false -d wutang/elasticsearch-shanghai-zone:5.6.10```
- ```cd /skywalking-docker/5.x/standalone/all-in-one/```
- ```docker build -t skywalking:5.0.0 .```
- 运行容器

```
docker run -d  --net=host \
-m 2048m --memory-swap 2400m \
-e DAE_SEGMENT="^127\.0\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
skywalking:5.0.0
```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/apache-skywalking-apm-incubating/logs```

#### 构建ElasticSearch镜像(Build ElasticSearch Image)
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```cd /skywalking-docker/5.x/standalone/elasticsearch-Zone-Asia-SH```
- ```cd 5.6.10/```或者```cd 6.3.2/```
- ```docker build -t es-sh .```

### 通过Docker Compose 一键启动(Start With Docker Compose)
参考：[Skywalking-Docker Quick Start](https://github.com/JaredTan95/skywalking-docker/blob/master/5.x/quick-start/README.md)

