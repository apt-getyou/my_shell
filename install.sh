#!/bin/bash


sudo apt-get install aptitude  -y
sudo aptitude install synaptic  -y
#sudo aptitude autoremove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video -y
sudo aptitude install compizconfig-settings-manager -y
#sudo aptitude install ubuntu-restricted-extras  --force-yes -y
sudo aptitude install preload  -y
sudo aptitude install vim -y

#移除亚马逊购物滤镜
sudo aptitude remove unity-lens-shopping -y


sudo aptitude install g++ -y
sudo aptitude install build-essential -y
sudo aptitude install vim-full -y

sudo aptitude install gnome-core-devel -y
sudo aptitude install libglib2.0-doc libgtk2.0-doc -y
sudo aptitude install devhelp -y
sudo aptitude install glade-gnome glade-common glade-doc -y


sudo aptitude install scim-dev -y
sudo aptitude install python-dev -y
sudo aptitude install python-enchant -y
sudo aptitude install python-gtk2-dev -y
sudo aptitude install libgtk2.0-dev -y

#tar jxvf scim-python-${version}.tar.bz2
#cd scim-python-${version}
#./configure –prefix=/usr
#make
#sudo make install


#sudo aptitude install flashplugin-installer -y  #安装flash

#Nautilus扩展（右键终端打开）
#sudo aptitude install nautilus-open-terminal  -y

#sudo aptitude install wine
#sudo aptitude install docky -y #mac任务栏

#安装压缩类软件
sudo aptitude install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar  -y

sudo aptitude install mplayer  -y
sudo aptitude install ffmpeg  -y

# 安装搜狗输入法
#sudo aptitude remove ibus
#sudo add-apt-repository ppa:fcitx-team/nightly
#sudo aptitude update
#sudo aptitude install fcitx tcitx-sogoupinyin
#sudo im-switch-s fcitx-z default
#安装TLP
sudo add-apt-repository ppa:linrunner/tlp -y
sudo aptitude update 
sudo aptitude install tlp tlp-rdw  -y

#CPU/内存负载指示程序
sudo add-apt-repository ppa:indicator-multiload/stable-daily  -y
sudo aptitude update
sudo aptitude install indicator-multiload  -y

#安装ubuntu tweak tool
#sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
#sudo aptitude update
#sudo aptitude install unity-tweak-tool  --force-yes -y



#Faience图标主题
sudo add-apt-repository ppa:tiheum/equinox -y
sudo aptitude update
sudo aptitude install -y faience-icon-theme
#安装多媒体编码器
#sudo -E wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo aptitude --quiet update && sudo aptitude --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo aptitude --quiet update
#sudo aptitude install non-free-codecs libdvdcss  --force-yes -y


#解决intel和NVIDIA双显卡问题
sudo add-apt-repository -y ppa:bumblebee/stable 
sudo aptitude update
sudo aptitude install -y bumblebee bumblebee-nvidia -y


#BURG美化启动菜单
#sudo add-apt-repository ppa:bean123ch/burg -y
#sudo aptitude update
#sudo aptitude install burg burg-themes
