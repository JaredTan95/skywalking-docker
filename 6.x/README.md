# Skywalking 6.x 镜像

[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-oap/) [![Docker Automated build](https://img.shields.io/docker/automated/wutang/skywalking-oap.svg)](https://hub.docker.com/r/wutang/skywalking-oap/builds/)

## 运行镜像（Run）:

```
docker-compose up [-d]
```

## 目录结构(Structure)

- **image-build/oap** : Skywalking-OAP-Server镜像构建。

- **image-build/ui**:  Skywalking-UI 镜像构建

- **config**: 关于*Skywalking-OAP-Server*的配置文件。

- **docker-compose/docker-compose.yml**: 快速启动。

- **TODO: kubernetes**: kubernetes快速启动。

## 手动构建镜像

- Skywalking-OAP镜像构建

```bash
cd image-build/oap

docker build -t Skywalking-OAP .

```

- Skywalking-UI镜像构建

```bash
cd image-build/ui

docker build -t Skywalking-UI .

```

## 与elasticsearch-shanghai-zone镜像配合使用请参考

- [wutang/elasticsearch-shanghai-zone:6.3.2](https://github.com/JaredTan95/skywalking-docker/blob/master/elasticsearch-6.3.2-Zone-Asia-SH/README.md)
- [quick start](https://github.com/JaredTan95/skywalking-docker/blob/master/6.x/quick-start/README.md)
