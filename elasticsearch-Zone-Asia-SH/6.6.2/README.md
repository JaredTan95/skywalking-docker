# elasticsearch-Zone-Asia-SH

Docker 镜像名称:[wutang/elasticsearch-shanghai-zone](https://hub.docker.com/r/wutang/elasticsearch-shanghai-zone/)

此镜像主要对官方的Elasticsearch的```docker.elastic.co/elasticsearch/elasticsearch:6.6.2```镜像做了封装，调整了镜像时区(Asia/ShangHai)，解决了在运行Skywalking的时候连接Elasticsearch时报错的问题。

## 拉取镜像（Pull Image）:
```docker pull wutang/elasticsearch-shanghai-zone:6.6.2```

## 运行镜像（Run）:
```docker run -p 9200:9200 -p 9300:9300 -e cluster.name=elasticsearch -d wutang/elasticsearch-shanghai-zone:6.6.2```

## 环境变量（Environment Variables）
```cluster.name```
Elasticsearch集群名称，运行Skywalking需要与此名称保持一致。





