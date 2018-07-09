#!/bin/bash
# install after base / grub /sudo/zsh/openssh/base-devel , use none-root useradd

# Get sudo permissions for script run sudo -v

# Update system packages
sudo pacman -Syu --noconfirm

# Install git and wget if necessary
sudo pacman -S --needed git wget reflector --noconfirm

# Install trizen
cd /tmp/
git clone https://aur.archlinux.org/trizen-git.git
cd trizen-git
makepkg -si
cd ~


# Install theme
# sudo pacman -S --needed arc-gtk-theme --noconfirm
trizen -S numix-themes-archblue-git numix-cursor-theme-git --noconfirm

# Install required packages from main Repos

sudo pacman -S --needed xorg-xrandr xorg-xdpyinfo --noconfirm
sudo pacman -S --needed imagemagick --noconfirm
sudo pacman -S --needed compton dunst feh i3-gaps conky jsoncpp libmpdclient lxappearance rofi unzip xautolock  volumeicon --noconfirm
trizen -S betterlockscreen polybar-git aur/i3lock-color --noconfirm

sudo pacman -S lightdm-gtk3-greeter --noconfirm
sudo systemctl enable lightdm
sudo systemctl start lightdm

# Install fonts for system
sudo pacman -S ttf-droid ttf-font-awesome wqy-microhei adobe-source-han-sans-cn-fonts ttf-dejavu ttf-bitstream-vera --noconfirm
trizen -S ttf-fira-code ttf-font-awesome-4 ttf-ms-fonts --noconfirm
trizen -S ttf-dejavu-sans-mono-powerline-git --noconfirm

# Reload font cache
fc-cache -f -v



# Download config files from GitHub
# cd ~
# git clone https://github.com/BurningSmile/dotfiles.git

# Install configs
# cd ~/dotfiles/
# mkdir ~/.config/polybar/
# mv ./polybar/* ~/.config/polybar/
# mkdir ~/.config/i3
# mv ./i3/config ~/.config/i3/
# mv ./i3/scripts ~/.config/i3
# mv .Xresources ~
# mkdir ~/.config/dunst
# mv ./dunst/dunstrc ~/.config/dunst/dunstrc
# mkdir ~/.config/rofi
# mv ./rofi/* ~/.config/rofi/

# Copy background image
# mkdir ~/Pictures/backgrounds
# mv ~/dotfiles/i3/Background/firewatch_ARC.jpg ~/Pictures/backgrounds

# base env
trizen -S ldm ntfs-3g --noconfirm
sudo pacman -S ghostscript cups --noconfirm
# manager printer user must be in groups sys and cups
sudo systemctl enable org.cups.cupsd
sudo systemctl start org.cups.cupsd


# Install Emacs
sudo pacman -S --needed aspell aspell-en --noconfirm
trizen -S emacs-git --noconfirm

# Install vim
sudo pacman -S --needed  gvim  --noconfirm
# sudo aura -Aa vim-plug-git --noconfirm
# cd ~/dotfiles/vim
# mkdir ~/.vim/
# mv ~/.vimrc ~/.vimrc.bak # Backup vimrc if present
# mv .vimrc ~
# cp -r ./.vim/ultisnips ~/.vim/
# cd ~

# Install vim plugins
# vim +PlugClean +PlugInstall +PlugUpdate +q! +q!

# Install you-complete-me for vim auto completion.
# sudo pacman -S --needed cmake clang python python3 python-pip --noconfirm
# mkdir /tmp/ycm_build
# cd /tmp/ycm_build
# cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
# cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
# cmake --build . --target ycm_core --config Release
# cd ~

# Install powerline
sudo pacman -S --needed powerline powerline-fonts powerline-vim --noconfirm

# Install favorite utility
sudo pacman -S --needed the_silver_searcher ripgrep --noconfirm

sudo pacman -S --needed fcitx-rime --noconfirm

trizen -S clipit unarchiver xarchiver --noconfirm
trizen -S bat --noconfirm

# network
sudo pacman -S --needed networkmanager network-manager-applet --noconfirm
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service
sudo pacman -S --needed ipcalc mtr wireshark-gtk gnu-netcat --noconfirm
sudo pacman -S ranger fd ncdu pv parallel fzf tldr --noconfirm


sudo pacman -S htop  httpie jq --noconfirm

sudo pip install -U asciinema visidata pgcli glances howdoi

trizen -S pspg --noconfirm

# Install entr
cd /tmp
wget http://entrproject.org/code/entr-4.0.tar.gz
tar -xzvf entr-4.0.tar.gz
cd eradman-entr-d5110481f5b9
./configure
make test
sudo make install

# Install tmux
sudo pacman -S --needed tmux xsel --noconfirm
trizen -S tmux-bash-completition --noconfirm

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cd ~


# Setup Mpd and Mpc
sudo pacman -S beets mpd mpc --noconfirm
sudo pip install -U pylast pyacoustid

mkdir -p ~/.mpd/playlists
cd ~/.mpd/
touch mpd.db mpd.log mpd.pid mpdstate
# sudo systemctl disable mpd.service

# Setup Ncmpcpp
sudo pacman -S ncmpcpp --noconfirm

# Setup Cava
# sudo aura -Aa cava --noconfirm
# mkdir ~/.config/cava
# mv ~/.config/cava/config ~/.config/cava/config.bak #Backup config if present
# mv ~/dotfiles/cava/config ~/.config/cava

# Setup urxvt
sudo pacman -S rxvt-unicode --noconfirm
# sudo aura -Aa urxvt-vtwheel urxvt-fullscreen --noconfirm

# Install zshell
sudo pacman -S zsh --noconfirm

# Install prezto
cat << 'EOF' >> /tmp/prezto-install.sh
#!/usr/bin/zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
EOF

chmod +x /tmp/prezto-install.sh
/tmp/prezto-install.sh
chsh -s /bin/zsh

# Application used
sudo pacman -S gstreamer ffmpeg smplayer --noconfirm


# system tools
trizen -S --noconfirm xorg-xev xorg-xprop lsof
# Tools
trizen -S zsh git subversion tmux mlocate
# Editor
# trizen -S vim sublime-text-imfix atom phpstorm
# network
trizen -S uget chromium google-chrome firefox vivaldi you-get --noconfirm
# dev
trizen -S nodejs npm php mariadb-client redis
trizen -S postman-bin dbeaver docker docker-compose
trizen -S virtualbox virtualbox-host-modules-arch virtualbox-ext-oracle virtualbox-guest-iso
# socia
trizen -S thunderbird deepin-wine-tim electronic-wechat
# music
trizen -S netease-cloud-music
# media process
trizen -S --noconfirm audacity
# wps、pdf
trizen -S wps-office ttf-wps-fonts foxitreader evince --noconfirm
# Photo
trizen -S gimp
# Game
trizen -S steam steam-native-runtime
#trizen -S steamcmd
# GFW
trizen -S shadowsocks kcptun tsocks proxychains-ng
# Remote
trizen -S teamviewer-beta
# 内网穿透
trizen -S frp
# Fonts
trizen -S ttf-iosevka adobe-source-code-pro-fonts
# Others
trizen -S sshpass keepassxc seadrive-gui
trizen -S --noconfirm calibre
# trizen -S man-pages-zh_cn
# Cleanup
