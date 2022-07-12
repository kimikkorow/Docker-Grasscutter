修改以下命令并运行
```
docker run -itd --name=容器名 --restart=always -e mongodb=数据库IP:端口 -e bindPort=Grasscutter服务端口 -e accessAddress=Grasscutter服务IP/公网IP/LAN口IP -p Grasscutter服务端口:Grasscutter服务端口 -p 22102:22102 kimikkorow/docker-grasscutter

```


进入容器运行一次grasscutter.jar，并选择语言
```
docker exec -it 容器名 /bin/bash
cd /app/Grasscutter
java -jar grasscutter.jar
```


重启容器，查看log
```
docker restart 容器名
docker logs -f 容器名
```