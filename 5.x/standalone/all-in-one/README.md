# Skywalking-Docker 镜像

[![Docker Build Status](https://img.shields.io/docker/build/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/wutang/skywalking-docker.svg)](https://hub.docker.com/r/wutang/skywalking-docker/)


Docker 镜像名称:[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)

## 拉取镜像（Pull Image）:
```docker pull wutang/skywalking-docker```

## 运行镜像（Run）:
### 主机模式启动（Host Mode）：
```
docker run -d  --net=host \
-m 2048m --memory-swap 2400m \
-e DAE_SEGMENT="^127\.0\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
wutang/skywalking-docker
```

### 端口映射模式启动（Port-Mapping Mode）
```
docker run -d  -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 \
-m 2048m --memory-swap 2400m \
-e DAE_SEGMENT="^172\.17\.\d{1,3}.\d{1,3}$" \
-e JAVA_OPTS="-Xms1024m -Xmx2048m" \
-e ES_CLUSTER_NAME=elasticsearch \
-e ES_ADDRESSES=127.17.0.3:9300 \
wutang/skywalking-docker
```
- 上面的`DAE_SEGMENT `需要根据实际情况进行修改。比如你的宿主机ip是`10.1.1.2`，那么此处需要更改为`^10\.1\.\d{1,3}.\d{1,3}$`
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/apache-skywalking-apm-incubating/logs```

## 环境变量（Environment Variables）
- ```DAE_SEGMENT```:容器会根据该正则表达式所匹配到的IP进行绑定。
- ```ES_CLUSTER_NAME```,```ES_ADDRESSES```:elasticsearch 地址和集群名称。注意：此处Elasticsearch地址中的端口务必是Elasticsearch TCP端口（9300）。
- ```BIND_HOST```: 操作系统IP或容器IP。
- ```UI_ADMIN_PASSWORD```:UI界面中管理员‘admin’的登录密码。

## 与elasticsearch-shanghai-zone镜像配合使用请参考
- [wutang/elasticsearch-shanghai-zone](https://github.com/JaredTan95/skywalking-docker/blob/master/elasticsearch-5.6.10-Zone-Asia-SH/README.md)
- [quick start](https://github.com/JaredTan95/skywalking-docker/blob/master/5.x/quick-start/README.md)


