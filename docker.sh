start_time=$(date +%s)

# docker run -d -p 1235:1234 --restart=always alpine/socat TCP-LISTEN:1234,fork TCP:172.17.0.1:3389

# docker-compose exec -it ubuntu /bin/bash

apt update

# 设置非交互式安装
export DEBIAN_FRONTEND=noninteractive

# 预设 xrdp 配置，避免交互提示
echo "xrdp xrdp/daemon string true" | debconf-set-selections

apt install xrdp -y

apt install xfce4 xfce4-goodies -y
echo xfce4-session > ~/.xsession

systemctl enable xrdp
systemctl start xrdp

end_time=$(date +%s)
total_time=$(echo "scale=1; ($end_time - $start_time) / 60" | bc)

echo "总耗时: $total_time 分钟"