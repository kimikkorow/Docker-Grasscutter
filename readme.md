创建docker-compose.yml文件
```
nano ./docker-compose.yml
```

修改并写入以下内容到docker-compose.yml
```
version: '3.3'
services:
  grasscutter:
    container_name: grasscutter
    restart: always
    network_mode: host
    environment:
      - mongodb=数据库IP:端口                     
      - bindPort=Grasscutter服务端口
      - accessAddress=公网IP/LAN口IP
      - GrasscuttersWebDashboard=6.0.0            # GrasscuttersWebDashboard插件版本号
      - opencommand=1.2.4                         # opencommand插件版本号
      - github_proxy=https://ghproxy.com/         # GitHub加速源 只支持格式为 https://ghproxy.com/https://github.com
    image: 'kimikkorow/docker-grasscutter:latest'    # 2.8/latest

  mongo:
    container_name: mongodb
    restart: always
    ports:
      - '27017:27017'
    volumes:
      - ./mongodb/data:/data/db
    image: mongo
```

运行容器：
```
docker-compose up -d
```