echo "更新系统包，修改时区"
apt update
apt upgrade -y
apt install -y tzdata
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata
rm -rf /var/lib/apt/lists/*

echo "安装依赖"
apt install sudo -y
sudo apt install nano git wget curl openjdk-17-jdk openjdk-17-jre -y

# 当前目录 /app
mkdir gitdate
mkdir Grasscutter

cd ./gitdate
# 当前目录/app/gitdate

echo "拉取Grasscutters/Grasscutter仓库"
git clone https://github.com/Grasscutters/Grasscutter.git --depth 1

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
git clone https://github.com/Koko-boya/Grasscutter_Resources.git --depth 1

cd ../Grasscutter 
# 当前目录/app/Grasscutter
mkdir resources

mv ../gitdate/Grasscutter_Resources/Resources/* ./resources

echo "创建插件目录"
mkdir plugins

echo "清理垃圾"
apt autoremove -y
apt autoclean -y
rm -rf /app/gitdate

echo "更换阿里源"
echo "deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
" >/etc/apt/sources.list