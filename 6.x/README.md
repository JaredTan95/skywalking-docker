# Skywalking 6.x 镜像

[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-oap/) [![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-oap.svg)](https://hub.docker.com/r/wutang/skywalking-oap/builds/)

## 运行镜像（Run）:

```
docker-compose up [-d]
```

## 目录结构(Structure)

- **oap** : Skywalking-OAP-Server镜像。

- **ui**:  Skywalking-UI 镜像

- **config**: 关于*Skywalking-OAP-Server*的配置文件。

- **docker-compose.yml**: 快速启动。

## 与elasticsearch-shanghai-zone镜像配合使用请参考

- [wutang/elasticsearch-shanghai-zone](https://github.com/JaredTan95/skywalking-docker/blob/master/elasticsearch-6.3.2-Zone-Asia-SH/README.md)
- [quick start](https://github.com/JaredTan95/skywalking-docker/blob/master/6.x/quick-start/README.md)
