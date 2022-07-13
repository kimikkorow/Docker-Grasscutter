FROM ubuntu:22.04
ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
    mongodb=localhost:27017 \
    bindPort=443 \
    accessAddress=127.0.0.1 \
    GrasscuttersWebDashboard=6.0.0 \
    opencommand=1.2.4 \
    github_proxy=https://ghproxy.com/

ADD . /app

RUN cd /app && sh data.sh

WORKDIR /app/
CMD chmod 0777 start.sh && bash start.sh