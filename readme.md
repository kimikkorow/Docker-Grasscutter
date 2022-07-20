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
    # 如果使用host模式，保持下方代码注销状态
    # ports:
    #   - '22102:22102'
    #   - '22102:22102/udp'
    #   - 'Grasscutter服务端口:Grasscutter服务端口/udp'
    #   - 'Grasscutter服务端口:Grasscutter服务端口'
    environment:
      - mongodb=mongo:27017                     
      - bindPort=Grasscutter服务端口
      - accessAddress=公网IP/LAN口IP
      - GrasscuttersWebDashboard=6.0.0            # GrasscuttersWebDashboard插件版本号，使用插件可以远程执行命令，以及避免卡在选择语言处
      - opencommand=1.2.4                         # opencommand插件版本号，使用插件可以远程执行命令，以及避免卡在选择语言处
      - github_proxy=https://ghproxy.com/         # GitHub加速源 只支持格式为 https://ghproxy.com/https://github.com
    image: 'kimikkorow/docker-grasscutter:latest'    # 2.8.5/latest

  mongo:
    container_name: mongodb
    restart: always
    # 理论上可以不开放数据库端口
    # ports:
    #   - '27017:27017'
    # 下方为数据挂载路径 默认为当前目录/mongodb，备份只需要备份这个目录
    volumes:
      - ./mongodb/data:/data/db
    image: mongo
```

运行容器：
```
docker-compose up -d
```