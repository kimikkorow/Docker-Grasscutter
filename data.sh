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

echo "拉取oliverlez22/Grasscutters2.8.5仓库"
git clone https://github.com/oliverlez22/Grasscutters2.8.5.git

echo "构建Grasscutter.jar"

cd ./Grasscutters2.8.5
# 当前目录/app/gitdate/Grasscutters2.8.5
chmod +x gradlew
./gradlew jar

mv *.jar ../../Grasscutter/grasscutter.jar
mv keystore.p12 ../../Grasscutter/

cd ../../gitdate
# 当前目录/app/gitdate

echo "拉取jinlili1111/Genshin-Impact-resources仓库"
git clone https://github.com/jinlili1111/Genshin-Impact-resources.git

cd ../Grasscutter 
# 当前目录/app/Grasscutter
mkdir resources

mv ../gitdate/Genshin-Impact-resources/* ./resources

echo "创建插件目录"
mkdir plugins

rm -rf /app/gitdate

