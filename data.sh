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

echo "拉取Frontrooms/3.0-GC仓库"
git clone https://github.com/Frontrooms/3.0-GC.git

echo "构建Grasscutter.jar"

cd ./3.0-GC
# 当前目录/app/gitdate/3.0-GC
chmod +x gradlew
./gradlew jar

mv *.jar ../../Grasscutter/grasscutter.jar
mv keystore.p12 ../../Grasscutter/

cd ../../gitdate
# 当前目录/app/gitdate

echo "拉取Frontrooms/3.0-Resources仓库"
git clone https://github.com/Frontrooms/3.0-Resources.git

cd ../Grasscutter 
# 当前目录/app/Grasscutter
mkdir resources

mv ../gitdate/3.0-Resources/* ./resources

echo "创建插件目录"
mkdir plugins

rm -rf /app/gitdate

