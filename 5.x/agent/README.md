# Skywalking-Agent

此镜像提供了Agent基础镜像，你可以基于此镜像定制自己的应用镜像，类似于java镜像。

## 用法（Useage）
将一个Java应用程序接入Skywalking,其中agent包在容器内```/apache-skywalking-apm-incubating/agent/```目录下：

```
FROM wutang/skywalking-agent:latest

LABEL maintainer="jian.tan@daocloud.io"

ENV SW_APPLICATION_CODE=java-demo-application \
	SW_COLLECTOR_SERVERS=192.168.1.1:10800,192.168.1.2:10800
	
COPY demo.jar /

# 更多参数请参考官方agent.config文件
ENTRYPOINT java -javaagent:/apache-skywalking-apm-incubating/agent/skywalking-agent.jar -Dskywalking.collector.servers=${SW_COLLECTOR_SERVERS} \
-Dskywalking.agent.application_code=${SW_APPLICATION_CODE} -jar /demo.jar
``` 
