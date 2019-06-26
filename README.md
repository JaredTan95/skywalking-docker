# Skywalking-Docker

通过[Apache-skywalking](https://github.com/apache/incubator-skywalking/)
官方发布的[压缩包](https://skywalking.incubator.apache.org/)构建Docker镜像。并提供容器部署Skywalking的方式。

[![GitHub stars](https://img.shields.io/github/stars/JaredTan95/skywalking-docker.svg?style=for-the-badge&label=Stars&logo=github)](https://github.com/JaredTan95/skywalking-docker) [![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/) [![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/builds/)

## Quick Start(快速开始)

```bash

git clone https://github.com/JaredTan95/skywalking-docker.git
cd skywalking-docker/6.x/docker-compose/
docker-compose up

```


[![asciicast](https://asciinema.org/a/rwZPy0SROmI1we0Na5Q4W6dRG.svg)](https://asciinema.org/a/rwZPy0SROmI1we0Na5Q4W6dRG?autoplay=1)


## Docker Hub

| Skywalking 6.x（推荐） | Skywalking 5.x| 
| :------| ------: |
| [wutang/skywalking-oap:6.1.0](https://hub.docker.com/r/wutang/skywalking-oap/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-oap.svg)](https://hub.docker.com/r/wutang/skywalking-oap/)| [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/) | 
| [wutang/skywalking-ui:6.1.0](https://hub.docker.com/r/wutang/skywalking-ui/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-ui.svg)](https://hub.docker.com/r/wutang/skywalking-ui/) | [wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-collector.svg)](https://hub.docker.com/r/wutang/skywalking-collector/)|
|[wutang/elasticsearch-shanghai-zone:6.3.2](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/elasticsearch-shanghai-zone.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)|[wutang/elasticsearch-shanghai-zone:5.6.10](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) [![Docker Pulls](https://img.shields.io/docker/pulls/wutang/elasticsearch-shanghai-zone.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)|

## 前置条件（Precondition）

 了解Docker或者使用过Docker、Kubernetes相关命令。

## 目录结构（Structure）

- `6.x`目录:官方仓库`6.x`分支容器部署镜像源文件：

- `elasticsearch-Zone-Asia-SH`目录:同步上海时区的Elasticsearch镜像源文件：

  - 用于自动构建[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) Docker镜像。
  - 其中`5.6.10`对应ES 5.6.10
  - `6.3.2`对应ES 6.3.2版本。

- `5.x`目录:官方仓库`5.x`分支容器部署镜像源文件：

  - `standalone/all-in-one`:用于自动构建[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) Docker镜像。
  - `standalone/all-in-one-xpack`:用于构建支持Elastic xpack账号密码登录的skywalking,常见阿里云ES,代码源由[liguobao/incubator-skywalking](https://github.com/liguobao/incubator-skywalking)基于incubator-skywalking 官方源码修改而来。
  - `standalone/collector`:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/) Docker镜像，该镜像用于部署单机Skywalking Collector。
  - `cluster/collector`:用于自动构建[wutang/skywalking-collector](https://hub.docker.com/r/wutang/skywalking-collector/):5.x-zk 镜像，该镜像用于通过Zookeeper实现集群部署Skywalking Collector。
  - `quick-start`:通过Docker stack或者Docker Compose快速启动Skywalking，其中包含启动[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/) 和[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)两个容器。

## 如何使用（Usage）

### 方式一、直接拉取镜像运行(Pull Image)

参考[6.x/docker-compose/docker-compose.yml](6.x/docker-compose/docker-compose.yml)

### 方式二、通过源码构建镜像(Build Image)

参考[6.x/README.md](6.x/README.md)
