sudo apt update && sudo apt upgrade -y
sudo timedatectl set-timezone Asia/Tokyo
sudo apt -y install task-japanese locales-all fonts-ipafont
sudo localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
source /etc/default/locale
sudo apt -y install fcitx-mozc
echo "/usr/bin/fcitx-autostart" >> ~/.sommelierrc
mkdir -p ~/.config/environment.d
touch ~/.config/environment.d/105-toshiya.conf
echo GTK_IM_MODULE=fcitx >> ~/.config/environment.d/105-toshiya.conf
echo QT_IM_MODULE=fcitx >> ~/.config/environment.d/105-toshiya.conf
echo XMODIFIERS=@im=fcitx >> ~/.config/environment.d/105-toshiya.conf
echo GDK_BACKEND=x11 >> ~/.config/environment.d/105-toshiya.conf
echo "Japanese input environment setup successful"