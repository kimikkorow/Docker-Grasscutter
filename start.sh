echo "更新插件"
cd /app/Grasscutter/plugins
rm -rf *.jar
curl ${github_proxy}https://github.com/liujiaqi7998/GrasscuttersWebDashboard/releases/download/${GrasscuttersWebDashboard}/GrasscuttersWebDashboard-${GrasscuttersWebDashboard}.jar -O
curl ${github_proxy}https://github.com/jie65535/gc-opencommand-plugin/releases/download/v${opencommand}/opencommand-dev-${opencommand}.jar -O

cd /app/Grasscutter

echo "生成所需文件"
java -jar grasscutter.jar

echo "设置config.json"
sed -i "s#127.0.0.1#${accessAddress}#g" `grep 127.0.0.1 -rl ./config.json`
sed -i "s#443#${bindPort}#g" `grep 443 -rl ./config.json`
sed -i "s#localhost:27017#${mongodb}#g" `grep localhost:27017 -rl ./config.json`

echo "运行jar"
java -jar grasscutter.jar