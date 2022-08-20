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
mkdir Grasscutter

