
# Skywalking-Dcoker for ES xpack 镜像

[![Docker Build Status](https://img.shields.io/docker/build/liguobao/skywalking-docker.svg)](https://hub.docker.com/r/liguobao/skywalking-docker/)
[![Docker Pulls](https://img.shields.io/docker/pulls/liguobao/skywalking-docker.svg)](https://hub.docker.com/r/liguobao/skywalking-docker/)

## Dockerfile说明

apache-skywalking-apm-incubating.tar.gz为支持ES X-Pack修改后打包出来的压缩包,此仓库没有这个文件的.

可以去QQ群:Apache SkyWalking交流群(392443393)群文件中下载apache-skywalking-apm-incubating-xpack.tar.gz

或者自行编译[liguobao/incubator-skywalking/tree/5.x](https://github.com/liguobao/incubator-skywalking/tree/5.x) 此版本的源码.

编译步骤:

```sh
# Prepare git, JDK8 and maven3
git clone https://github.com/liguobao/incubator-skywalking.git
cd incubator-skywalking/
git checkout 5.x
#Switch to the tag by using git checkout [tagname] (Optional, switch if want to build a release from source codes)
git submodule init
git submodule update
Run ./mvnw clean package -DskipTests
#All packages are in /dist.(.tar.gz for Linux and .zip for Windows).
```

Docker 镜像名称:[liguobao/skywalking-docker](https://hub.docker.com/r/liguobao/skywalking-docker/)

## 拉取镜像（Pull Image）:
```docker pull liguobao/skywalking-docker:5.0.RC2.xpack```

## 运行镜像（Run）for ES xpack:
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -e SECURITY_USER='elastic:password' -d liguobao/skywalking-docker:5.0.RC2.xpack```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/apache-skywalking-apm-incubating/logs```

## 环境变量（Environment Variables）
- ```ES_CLUSTER_NAME```,```ES_ADDRESSES```:elasticsearch 地址和集群名称。注意：此处Elasticsearch地址中的端口务必是Elasticsearch TCP端口。
- ```SECURITY_USER```,```SECURITY_USER```:elasticsearch 的账号密码,使用X-Pack实现的,常见阿里云ES,格式为:'user:password'.此参数不传入或者传入'' ,默认使用没有授权的client.
- ```NAMING_BIND_HOST```,```NAMING_BIND_PORT```:OS real network IP(binding required),for agent to find collector cluster.
- ```BIND_HOST```,```REMOTE_BIND_PORT```:OS real network IP(binding required),for collector nodes communicate with each other in cluster. collectorN --(gRPC) --> collectorM
- ```AGENT_GRPC_BIND_PORT```:OS real network IP(binding required),for agent to uplink data(trace/metrics) to collector. agent--(gRPC)--> collector
- ```AGENT_JETTY_BIND_HOST```,```AGENT_JETTY_BIND_PORT```:OS real network IP(binding required), for agent to uplink data(trace/metrics) to collector through HTTP. agent--(HTTP)--> collector
-```UI_JETTY_BIND_HOST```,```UI_JETTY_BIND_PORT```:Stay in `0.0.0.0` if UI starts up in default mode.Change it to OS real network IP(binding required), if deploy collector in different machine.



## 与elasticsearch-shanghai-zone镜像配合使用请参考
- [wutang/elasticsearch-shanghai-zone](../../../elasticsearch-5.6.10-Zone-Asia-SH/README.md)
- [quick start](../5.x/quick-start/README.md)


