#!/bin/bash

# Upgrade
# sudo sed --in-place 's/focal/groovy/g' /etc/apt/sources.list
sudo dpkg --add-architecture i386
sudo add-apt-repository -y ppa:leaningtech-dev/cheerp-ppa
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get dist-upgrade -y && \
sudo apt-get autoremove -y && \
sudo apt-get autoclean -y && \
sudo sync && \
sudo sync

# Tools
tools=(
  kubuntu-desktop
  xfce4 lightdm
  wine64 wine32
  zsh imagemagick
  curl file wget nmap rclone unzip neofetch gpg-agent git httpie keychain
  cheerp-core gcc g++ gdb clang lldb llvm git python3 python3-pip build-essential
  pkg-config libssl-dev libxcb-composite0-dev libpq-dev software-properties-common
)

sudo apt install -y ${tools[@]}

# Nix package manager
sh <(curl -L https://nixos.org/nix/install) --no-daemon
. /home/david/.nix-profile/etc/profile.d/nix.sh

# Home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

# Copy home configuration
cp .config/* ~/.config -rf

# Install manager
home-manager switch

# Add menu items to profile
printf "export XDG_DATA_DIRS="/home/david/.nix-profile/share:$XDG_DATA_DIRS"\n" | sudo tee -a ~/.profile >/dev/null

# Change shell to zsh
# sudo chsh -s $(which zsh)
chsh -s /usr/bin/zsh

cp .zshrc ~ -f
cp .p10k.zsh ~ -f
# cp .gitconfig ~ -f
cp .ssh ~ -rf

# Rust
sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y -q

# NVM node
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
# FNM
curl -fsSL https://fnm.vercel.app/install | bash

# Deno
curl -fsSL https://deno.land/x/install/install.sh | sh

# Add cron job to clean RAM
# printf '*/5 * * * * echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run\n' | crontab
sudo ./add_crontab.sh

# Check last time of freeing memory
# sudo stat -c '%y' /root/drop_caches_last_run

# Add cron to sudoers
printf "%%sudo ALL=NOPASSWD: /etc/init.d/cron start\n" | sudo tee -a /etc/sudoers >/dev/null

# Setup Clion remote server
wget https://raw.githubusercontent.com/JetBrains/clion-wsl/master/ubuntu_setup_env.sh && bash ubuntu_setup_env.sh

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# WSL toolbar
# pip3 install wsl-windows-toolbar cairosvg
# wsl-windows-toolbar -J wsl-windows-toolbar-template.sh.j2

# Oh-My-Posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
