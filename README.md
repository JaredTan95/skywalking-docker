# Skywalking-Docker
通过Apache-skywalking官方发布的[压缩包](https://skywalking.incubator.apache.org/)构建Docker镜像。提供一键启动单机演示版Skywalking的方式。

[Apache-skywalking官方源码](https://github.com/apache/incubator-skywalking/)

## Usage
### 直接拉取镜像运行
- 镜像地址：[wutang/skywalking-docker](https://hub.docker.com/r/wutang/skywalking-docker/)
- 运行：```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d wutang/skywalking-docker:latest```
- 使用浏览器访问```http://localhost:8080```即可.

### 自己构建镜像
- [安装Docker环境](https://www.docker.com/community-edition#/overview)
- ```git clone https://github.com/JaredTan95/skywalking-docker.git```
- ```Elasticsearch安装(如果已安装可跳过此步骤)，版本要求5.x：docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -e xpack.security.enabled=false -d docker.elastic.co/elasticsearch/elasticsearch:5.6.10```
- ```cd /skywalking-docker/5.x/standalone```
- ```docker build -t skywalking:5.0.0 .```
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=elasticsearch -e ES_ADDRESSES=192.168.2.96:9300 -d skywalking:5.0.0```
- 使用浏览器访问```http://localhost:8080```即可.
- 日志挂载 ```-v /your/log/path:/sky/logs```
