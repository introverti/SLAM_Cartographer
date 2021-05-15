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

:warning::warning::warning:**不要使用最新的21.04版本 无论是国外源 还是国内的 阿里云和高校镜像 都没有ROS的Release 文件**

*其他建议：*

1. :fire:*最好给树梅派安排个风扇控制温度, 使用下面的命令可以获取CPU温度 (value/1000 单位℃)*:thermometer::

   > cd /sys/class/thermal/thermal_zone0
   >
   > cat temp

 2. :fast_forward:*使用至少32G的高速SD卡 或者外接USB,硬盘启动,注意是否需要额外供电:electric_plug:*

 3. :signal_strength:*Ubuntu server 配置wifi 以及安装界面* 

    > #yaml 文件名称可能有所差异
    >
    > sudo vim /etc/netplan/50-cloud-init.yaml
    
    > #修改yaml文件如下：
    > network:
    >    version: 2
    >    ethernets:
    > 	………………(此处不用修改已省略）
    >    wifis:
    >        wlan0:
    >            dhcp4: true
    >            access-points:
    >                "wifi名称":
    >                    password: "wifi密码"
    >
    > #注意 wifis和 ethernets对齐 如果输入正确 关键词都会染色高亮
    
    > #调试配置文件，如果输入错误会有报错，根据报错修改
    > sudo netplan try
    > #应用配置文件
    > sudo netplan apply
    > #执行完这一步 wifi就应该连接成功了
    
    > #更新系统 并安装Ubuntu界面 （耗时较长）也可以选择其他图形化界面比如：mate
    > sudo apt-get update 
    > sudo apt-get dist-upgrade -y 
    > sudo apt-get install ubuntu-desktop -y

###   ROS的安装

默认安装 ROS noetic 版本，不同版本在安装是需要注意修改commands 中的版本名称





