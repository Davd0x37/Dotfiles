#!/bin/bash

# Upgrade
# sudo dpkg --add-architecture i386
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get dist-upgrade -y && \
sudo apt-get autoremove -y && \
sudo apt-get autoclean -y && \
sudo sync && \
sudo sync

# Tools
tools=(
  zsh
  curl file wget nmap rclone unzip neofetch gpg-agent git httpie keychain
  gcc g++ gdb clang lldb llvm git python3 python3-pip build-essential
  pkg-config libssl-dev libxcb-composite0-dev libpq-dev software-properties-common
)

sudo apt install -y ${tools[@]}

# Change shell to zsh
chsh -s /usr/bin/zsh

cp .zshrc ~ -f
cp .p10k.zsh ~ -f
cp .ssh ~ -rf

# Rust
sh -c "$(curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs)" -- -y -q

# Volta
curl https://get.volta.sh | bash

# Deno
curl -fsSL https://deno.land/x/install/install.sh | sh

# Add cron job to clean RAM
# printf '*/5 * * * * echo 3 > /proc/sys/vm/drop_caches; touch /root/drop_caches_last_run\n' | crontab
sudo ./add_crontab.sh

# Check last time of freeing memory
# sudo stat -c '%y' /root/drop_caches_last_run

# Add cron to sudoers
printf "%%sudo ALL=NOPASSWD: /etc/init.d/cron start\n" | sudo tee -a /etc/sudoers >/dev/null

# Oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# Syntax highlighting
git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
