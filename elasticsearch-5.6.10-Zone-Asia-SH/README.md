# elasticsearch-5.6.10-Zone-Asia-SH

[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/) 
[![Docker Pulls](https://img.shields.io/docker/pulls/wutang/elasticsearch-shanghai-zone.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)
[![Docker Automated build](https://img.shields.io/docker/automated/wutang/elasticsearch-shanghai-zone.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/builds/)
[![ImageLayers Size](https://img.shields.io/imagelayers/image-size/wutang/elasticsearch-shanghai-zone/latest.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/wutang/elasticsearch-shanghai-zone/latest.svg)](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)

Docker 镜像名称:[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)

此镜像主要对官方的Elasticsearch的```docker.elastic.co/elasticsearch/elasticsearch:5.6.10```镜像做了封装，调整了镜像时区(Asia/ShangHai)，解决了在运行Skywalking的时候连接Elasticsearch时报错的问题。

## 拉取镜像（Pull Image）:
```docker pull wutang/elasticsearch-shanghai-zone```

## 运行镜像（Run）:
```docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -e xpack.security.enabled=false -d wutang/elasticsearch-shanghai-zone```

## 环境变量（Environment Variables）
```cluster.name```
Elasticsearch集群名称，运行Skywalking需要与此名称保持一致。

```xpack.security.enabled```
是否开启xpack安全验证，在运行Skywalking中需要将其关闭。

## 与Skywalking-Docker镜像配合使用请参考
- [wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)
- [quick start](../5.x/quick-start/README.md)




