# Skywalking-Dcoker Quick Start
其中引用了[wutang/elasticsearch-shanghai-zone ](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)镜像和[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/) 镜像

- ```cd /skywalking-docker/5.x/quick-start/```
- ```docker-compose up [-d]```

偶尔可能因为elasticsearch启动较慢导致skywalking启动失败,常见于UI报500错误.

此时确保elasticsearch 9200能正常返回数据之后,重启一下skywalking容器即可.