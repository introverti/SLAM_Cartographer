# SLAM_Cartographer
Ubuntu 20.04+ROS_Noetic+Cartographer+EAIX4Lidar+JY901 and more

## 安装环境

### Ubuntu 的安装

默认使用的是 VM 虚拟机 +[Ubuntu 20.04](https://ubuntu.com/download/desktop) 的组合

尝试过Rasspbery Pi 4B + [Ubuntu mate 20.04_Release](https://releases.ubuntu-mate.org/20.04/armhf/) or [offical site](https://ubuntu-mate.org/download/arm64/focal/) 和 [Ubuntu 18.04.5 LTS (Bionic Beaver)](http://cdimage.ubuntu.com/releases/18.04/release/)

- [x] 推荐使用: **ubuntu-mate-20.04.1-desktop-arm64+raspi.img.xz**
  1. 有mate轻量级桌面
  2. wifi好配置
  3. 支持ROS noetic

- [ ] 如果使用 **ubuntu-18.04.5-preinstalled-server-arm64+raspi4.img.xz** 
  1. Console 操作，需要额外安装桌
  2. wifi配置复杂，最好使用网线连接
  3. ROS melodic or kinetic

:warning::warning::warning:**不要使用最新的20.04版本 无论是国外源 还是国内的 阿里云和高校镜像 都没有ROS的Release 文件**

*其他建议：*

​	​1​.​ :fire:*最好给树梅派安排个风扇控制温度, 使用下面的命令可以获取CPU温度 (value/1000 单位℃)*:thermometer:

> cd /sys/class/thermal/thermal_zone0
> cat temp

​	2. :fast_forward:*使用至少32G的高速SD卡 或者外接USB,硬盘启动,注意是否需要额外供电:electric_plug:*

#### Ubuntu server 配置WIFI

> sudo vim /etc/netplan/50-cloud-init.yaml

>wifis:
>wlan0:
>  access-points:
>      "WIFI名称": 
>           password: "密码"
>       dhcpd: true

>sudo netplan debug
>
>sudo netplan apply