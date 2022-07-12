cd /app/Grasscutter

echo "设置config.json"
sed -i "s#127.0.0.1#${accessAddress}#g" `grep 127.0.0.1 -rl ./config.json`
sed -i "s#443#${bindPort}#g" `grep 443 -rl ./config.json`
sed -i "s#localhost#${mongodb}#g" `grep localhost -rl ./config.json`

echo "运行grasscutter.jar"
java -jar grasscutter.jar