FROM ubuntu:22.04
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
ADD . /app

RUN cd /app && sh data.sh

WORKDIR /app/
CMD chmod 0777 start.sh && bash start.sh