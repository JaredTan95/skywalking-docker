# skywalking-docker
deployment skywalking with docker container.

## Usage
- ```cd /skywalking-docker/5.x/standalone```
- ```docker build -t skywalking:5.0.0 .```
- ```docker run -p 8080:8080 -p 10800:10800 -p 11800:11800 -p 12800:12800 -e ES_CLUSTER_NAME=sky-es-docker-cluster -e ES_ADDRESSES=192.168.2.96:9300 -d skywalking:5.0.0```
- 使用浏览器访问```http://localhost:8080```即可.