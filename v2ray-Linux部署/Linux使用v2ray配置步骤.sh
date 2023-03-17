# 1.先下载对应64/arm64版本的v2ray-core包并解压 
https://github.com/v2ray/v2ray-core/releases/
unzip v2ray-linux-arm64-v8a.zip -d v2ray-linux-arm64-v8a

# 2.备份win客户端的服务器配置文件，命名为config.json，放到v2ray-linux-arm64-v8a目录里
mv config.json v2ray-linux-arm64-v8a 

# 3.新建日志文件与文件夹
mkdir  /usr/local/share/v2ray/ |
mkdir /usr/local/etc/v2ray/ |
mkdir /var/log/v2ray/

# 3.切换root用户，将相应的文件放置到对应的路径
mv v2ray /usr/local/bin/v2ray | \
mv v2ctl /usr/local/bin/v2ctl | \
mv geoip.dat /usr/local/share/v2ray/geoip.dat | \
mv geosite.dat /usr/local/share/v2ray/geosite.dat | \
mv config.json /usr/local/etc/v2ray/config.json | \
mv systemd/system/v2ray.service /etc/systemd/system/v2ray.service | \
mv systemd/system/v2ray@.service /etc/systemd/system/v2ray@.service 

# 4.启动V2ray
sudo systemctl start v2ray 
sudo systemctl status v2ray
sudo systemctl enable v2ray

# 5.检验代理是否成功生效,返回google.com的源代码，即表示配置成功
curl -x socks5://127.0.0.1:10808 https://www.google.com -v

# 6.设置shell终端代理
vim ~/.bashrc
export ALL_PROXY="socks5://127.0.0.1:10808"
export http_proxy="http://127.0.0.1:10809"
source ~/.bashrc