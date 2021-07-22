sudo echo 'APT::Acquire::Retries "3";' > /etc/apt/apt.conf.d/80-retries
sudo apt-get purge cloud-init -y
sudo rm -rf /etc/cloud/ && sudo rm -rf /var/lib/cloud/
sudo apt update
sudo apt install xterm -y
sudo apt install neofetch -y
# sudo apt install openssh-server -y
# sudo systemctl enable ssh 
sudo apt-get install xserver-xorg-core openbox xinit -y
sudo apt install --no-install-recommends lightdm-gtk-greeter -y
sudo apt install --no-install-recommends lightdm -y
sudo apt install libjavascriptcoregtk-4.0-18 -y
sudo apt install --no-install-recommends libwebkit2gtk-4.0-37 -y

wget https://download.opensuse.org/repositories/home:/antergos/xUbuntu_17.10/amd64/lightdm-webkit2-greeter_2.2.5-1+15.31_amd64.deb
sudo dpkg -i lightdm-webkit2-greeter_2.2.5-1+15.31_amd64.deb

sudo "cat > /etc/lightdm/lightdm.conf << EOF
[Seat:*]
greeter-session=lightdm-webkit2-greeter
EOF"


git clone https://github.com/joshuabloemer/Aether.git
sudo cp --recursive Aether /usr/share/lightdm-webkit/themes/lightdm-webkit-theme-aether
sudo sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = lightdm-webkit-theme-aether #\1/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i 's/^\(#?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter #\1/ #\2g' /etc/lightdm/lightdm.conf
# sudo apt update && sudo apt upgrade -y
sudo reboot