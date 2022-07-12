FROM ubuntu:22.04
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
    mongodb=localhost \
    bindPort=443 \
    accessAddress=127.0.0.1
ADD . /app

RUN cd /app && sh data.sh

WORKDIR /app/
CMD chmod 0777 start.sh && bash start.sh