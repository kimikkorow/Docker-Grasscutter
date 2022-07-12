echo "更新系统包"
apt-get update 
apt-get upgrade -y

echo "设置时区"
apt-get install -y tzdata
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo Asia/Shanghai >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

echo "安装依赖"
apt-get install sudo nano git wget curl openjdk-17-jdk openjdk-17-jre -y

# 当前目录 /app
mkdir gitdate
mkdir Grasscutter

cd ./gitdate
# 当前目录/app/gitdate

echo "拉取Grasscutters/Grasscutter仓库"
git clone https://github.com/Grasscutters/Grasscutter.git

echo "构建Grasscutter.jar"

cd ./Grasscutter
# 当前目录/app/gitdate/Grasscutter
chmod +x gradlew
./gradlew jar

mv *.jar ../../Grasscutter/grasscutter.jar
mv keystore.p12 ../../Grasscutter/

cd ../../gitdate
# 当前目录/app/gitdate

echo "拉取Koko-boya/Grasscutter_Resources仓库"
git clone https://github.com/Koko-boya/Grasscutter_Resources.git

cd ../Grasscutter 
# 当前目录/app/Grasscutter
mkdir resources

mv ../gitdate/Grasscutter_Resources/Resources/* ./resources

echo "创建插件目录"
mkdir plugins

echo "生成所需文件"
java -jar grasscutter.jar

