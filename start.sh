cd /app/Grasscutter

echo "生成所需文件"
java -jar grasscutter.jar

echo "设置config.json"
sed -i "s#127.0.0.1#${accessAddress}#g" `grep 127.0.0.1 -rl ./config.json`
sed -i "s#443#${bindPort}#g" `grep 443 -rl ./config.json`
sed -i "s#localhost:27017#${mongodb}#g" `grep localhost:27017 -rl ./config.json`

echo "运行jar"
java -jar grasscutter.jar