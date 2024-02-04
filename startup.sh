#!/bin/bash

echo "Welcome! Let's start setting up your system xD It could take more than 10 minutes, be patient"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install build-essential -y

# set double-click windo cascading
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-overview'

echo 'installing wget'
sudo apt install gdebi-core wget

echo 'installing curl' 
sudo apt install curl -y

echo 'installing vim'
sudo apt install vim -y
clear

echo 'installing transmission'
sudo apt install transmission

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false


echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.bashrc

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension Shan.code-settings-sync

echo 'installing spotify' 
snap install spotify

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sh -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash)"

export NVM_DIR="$HOME/.nvm" && (
git clone https://github.com/creationix/nvm.git "$NVM_DIR"
cd "$NVM_DIR"
git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

echo '\nexport PATH=/usr/local/share/npm/bin:$PATH\n'

echo '\nexport NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"\n' >> .zshrc

source ~/.bashrc
nvm --version
nvm install 16
nvm alias default 16
node --version
npm --version

echo 'installing Typescript'
npm install -g typescript


echo 'installing franz' 
sudo apt-get update
sudo apt-get install com.meetfranz.meetfranz

echo 'installing discord'
sudo apt-get update
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb -y

echo 'adding dracula theme'
mkdir ~/.config/terminator
touch ~/.config/terminator/config
cat <<EOF >  ~/.config/terminator/config
[global_config]
  title_transmit_bg_color = "#ad7fa8"
[keybindings]
  close_term = <Primary>w
  close_window = <Primary>q
  new_tab = <Primary>t
  new_window = <Primary>i
  paste = <Primary>v
  split_horiz = <Primary>e
  split_vert = <Primary>d
  switch_to_tab_1 = <Primary>1
  switch_to_tab_10 = <Primary>0
  switch_to_tab_2 = <Primary>2
  switch_to_tab_3 = <Primary>3
  switch_to_tab_4 = <Primary>4
  switch_to_tab_5 = <Primary>5
  switch_to_tab_6 = <Primary>6
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    cursor_color = "#aaaaaa"
EOF


cat <<EOF >>  ~/.config/terminator/config
[[Dracula]]
    background_color = "#1e1f29"
    background_darkness = 0.88
    background_type = transparent
    copy_on_selection = True
    cursor_color = "#bbbbbb"
    foreground_color = "#f8f8f2"
    palette = "#000000:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#bbbbbb:#555555:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#ffffff"
    scrollback_infinite = True
EOF

### DOCKER ENGINE
echo 'installing docker' 

# Remove old packages
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo docker run hello-world

# 

echo 'installing fzf'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
source ~/.bashrc

echo 'installing dbeaver'
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -f

echo 'installing Postman' 
snap install postman

echo 'installing Redocs'
sudo npm install -g @redocly/openapi-cli

echo 'commiting changes'
source ~/.bashrc
sudo dpkg --configure -a 
sudo apt-get update --fix-missing
sudo apt-get autoremove
rm -rf = bash_completion Close Compressing discord.deb Downloading nvm 

clear 

echo 'Do you wanna install extra content? (y/N)'
read extra_content
if echo "$extra_content" | grep -iq "^y" ;then
	echo 'installing vlc'
  sudo apt install vlc -y
  sudo apt install vlc-plugin-access-extra libbluray-bdj libdvdcss2 -y

  echo 'installing transmission'
  sudo add-apt-repository ppa:transmissionbt/ppa
  sudo apt-get update
  sudo apt-get install transmission transmission-qt -y

  echo 'installing Robo3t'
  snap install robo3t-snap

  echo 'installing kubectl'
  curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

  echo 'installing heroku-cli'
  curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
  heroku --version

  echo 'installing aws-cli' 
  sudo apt-get install awscli -y
  aws --version
  curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
  sudo dpkg -i session-manager-plugin.deb
  session-manager-plugin --version
else
	echo "Okay, no problem. :) Let's finish it then!"
fi



echo 'All tools successfully installed. You are ready to shine :).'
