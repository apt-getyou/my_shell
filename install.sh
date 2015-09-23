#!/bin/bash

echo "安装必要软件"
sudo apt-get install aptitude  -y

sudo aptitude install synaptic  -y
sudo aptitude remove unity-lens-music unity-lens-photos unity-lens-gwibber unity-lens-shopping unity-lens-video -y
sudo aptitude install compizconfig-settings-manager -y
sudo aptitude install ubuntu-restricted-extras -y
sudo aptitude install preload  -y
sudo aptitude install vim -y

#移除亚马逊购物滤镜
sudo aptitude remove unity-lens-shopping -y

#编译相关
sudo aptitude install -y g++ build-essential vim-full gnome-core-devel libglib2.0-doc libgtk2.0-doc devhelp glade-gnome glade-common glade-doc scim-dev python-dev python-enchant python-gtk2-dev libgtk2.0-dev


#sudo aptitude install flashplugin-installer -y  #安装flash

#Nautilus扩展（右键终端打开）
sudo aptitude install nautilus-open-terminal  -y

#安装压缩类软件
sudo aptitude install unace unrar zip unzip p7zip-full p7zip-rar sharutils rar  -y

#安装播放器
sudo aptitude install mplayer ffmpeg  -y

# 安装搜狗输入法
#sudo aptitude remove ibus
#sudo add-apt-repository ppa:fcitx-team/nightly
#sudo aptitude update
#sudo aptitude install fcitx tcitx-sogoupinyin
#sudo im-switch-s fcitx-z default


sudo add-apt-repository ppa:linrunner/tlp -y
sudo add-apt-repository ppa:indicator-multiload/stable-daily  -y
sudo add-apt-repository ppa:bumblebee/stable -y
sudo aptitude update 

#安装TLP
sudo aptitude install tlp tlp-rdw  -y

#CPU/内存负载指示程序
sudo aptitude install indicator-multiload  -y

#解决intel和NVIDIA双显卡问题
sudo aptitude install -y bumblebee bumblebee-nvidia -y

echo "解决gedit乱码"
gsettings set org.gnome.gedit.preferences.encodings auto-detected "['UTF-8','GB18030','GB2312','GBK','BIG5','CURRENT','UTF-16']"

echo "乱码解决完毕"

echo "解决浏览器字体发虚"
#dir define
myfonts_dir=/usr/share/fonts/truetype/myfonts
remote_dir=http://files.cnblogs.com/DengYangjun

#fonts define
monaco=monaco-linux.ttf
lucida=lucida-console.ttf
msyh=msyh.ttf
msyhbd=msyhbd.ttf
agencyr=agencyr.ttf
agencyrb=agencyrb.ttf

screen=0

sudo mkdir $myfonts_dir 2>/dev/null

echo "请选择显示器类型(1-2)：1-LED	2-CRT"
read screen
case $screen in
1) 
	wget -O local.conf.zip  $remote_dir/local.conf.led.zip
	;;
2)	
	wget -O local.conf.zip  $remote_dir/local.conf.crt.zip
	;;
?) 
	echo "无效选择，退出安装，安装未完成。"
	exit 1;
esac

echo "Ubuntu字体自动安装工具"
echo "(C)2008-2009 Deng.Yangjun@Gmail.com"

echo "安装等宽英文台字体:Monaco"
wget -O $monaco.zip $remote_dir/$monaco.zip
unzip -o $monaco.zip 1>/dev/null
sudo mv $monaco $myfonts_dir
rm $monaco.zip

echo "安装等宽英文字体:Lucida Console"
wget -O $lucida.zip $remote_dir/$lucida.zip
unzip -o $lucida.zip 1>/dev/null
sudo mv $lucida $myfonts_dir
rm $lucida.zip

echo "安装英文字体:Agency FB"
wget -O $agencyr.zip $remote_dir/$agencyr.zip
unzip -o $agencyr.zip 1>/dev/null
sudo mv $agencyr $myfonts_dir
rm $agencyr.zip

wget -O $agencyrb.zip $remote_dir/$agencyrb.zip
unzip -o $agencyrb.zip 1>/dev/null
sudo mv $agencyrb $myfonts_dir
rm $agencyrb.zip

echo "安装字体:微软雅黑"
wget -O $msyh.zip $remote_dir/$msyh.zip
unzip -o $msyh.zip 1>/dev/null
sudo mv $msyh $myfonts_dir
rm $msyh.zip

wget -O $msyhbd.zip $remote_dir/$msyhbd.zip
unzip -o $msyhbd.zip 1>/dev/null
sudo mv $msyhbd $myfonts_dir
rm $msyhbd.zip

unzip -o local.conf.zip 1>/dev/null
sudo mv /etc/fonts/conf.avail/51-local.conf /etc/fonts/conf.avail/51-local.conf.old
sudo mv local.conf /etc/fonts/conf.avail/51-local.conf
rm local.conf.zip

cd /etc/fonts/conf.avail
sudo mv 69-language-selector-zh-cn.conf 69-language-selector-zh-cn.conf.old 2>/dev/null

echo "请稍等，正在刷新系统字体..."
cd $myfonts_dir
sudo chmod 555 *
sudo mkfontscale 1>/dev/null
sudo mkfontdir 1>/dev/null
sudo fc-cache -v 1>/dev/null

echo "字体安装完毕，发虚问题已经改善，重启浏览器即可查看效果"

echo "第五步：删除系统自带的不需要的软件"
echo "删除thunderbird雷鸟、音乐播放器rhythmbox、电影播放器totem、互联网通信empathy、互联网即使通讯pidgin、多媒体VLC、硅博Gwibber"
echo "y" |sudo apt-get purge thunderbird 
echo "y" |sudo apt-get purge rhythmbox 
echo "y" |sudo apt-get purge totem 
echo "y" |sudo apt-get purge empathy
echo "y" |sudo apt-get purge pidgin 
echo "y" |sudo apt-get purge VLC 
echo "y" |sudo apt-get purge gwibber
echo "多余软件删除已完成"

echo "第七步：升级系统"
sudo apt-get -y upgrade
sudo apt-get autormove
sudo apt-get autoclean

echo "系统升级完成,五分钟后系统将自动重启"
sudo shutdown -r +5
