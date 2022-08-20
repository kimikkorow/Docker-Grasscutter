echo "更新系统包"
apt-get update 
apt-get upgrade -y

echo "设置时区"
apt-get install -y tzdata
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
echo Asia/Shanghai >/etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

echo "安装依赖"
apt install sudo -y
sudo apt install nano git wget curl openjdk-17-jdk openjdk-17-jre -y

# 当前目录 /app
mkdir Grasscutter

