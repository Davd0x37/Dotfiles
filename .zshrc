# sudo /etc/init.d/cron start
[ -z "$(ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null

. /home/david/.nix-profile/etc/profile.d/nix.sh

export DENO_INSTALL="/home/david/.deno"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$DENO_INSTALL/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export ZSH="/home/david/.oh-my-zsh"
export PATH=/home/david/.fnm:$PATH

ZSH_THEME=""
plugins=(
  git
  cargo
  docker
  docker-compose
  dotnet
  gitignore
  gpg-agent
  # keychain
  nvm
  yarn
  vscode
  zsh-autosuggestions
  fast-syntax-highlighting
  # zsh-syntax-highlighting
)

zstyle :omz:plugins:keychain agents gpg,ssh
zstyle :omz:plugins:keychain identities Haven
zstyle :omz:plugins:keychain options --quiet

source $ZSH/oh-my-zsh.sh

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
eval "$(fnm env)"

eval "$(navi widget zsh)"

# Aliases
alias ..="cd .."
alias cat="bat"
alias l="exa --header --git --classify --long --binary --group --time-style=long-iso --links --all --icons --group-directories-first --sort=name"

# Enable starship
# eval "$(starship init zsh)"
eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/slim.omp.json)"

export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=192.168.1.16:0.0


# # export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0 # in WSL 2
# export LIBGL_ALWAYS_INDIRECT=1
# # export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
# #GWSL_EXPORT_DISPLAY
# ipconfig_exec=$(wslpath "C:\\Windows\\System32\\ipconfig.exe")
# if [ -x $(which ipconfig.exe) ]
# then
#   ipconfig_exec=$(which ipconfig.exe)
# fi

# wsl2_d_tmp=$($ipconfig_exec | grep -n -m 1 "Default Gateway.*: [0-9a-z]" | cut -d : -f 1)
# if [ -n $wsl2_d_tmp ]
# then
#   first_line=$(expr $wsl2_d_tmp - 4)
#   wsl2_d_tmp=$($ipconfig_exec | sed $first_line,$wsl2_d_tmp!d | grep IPv4 | cut -d : -f 2 | sed -e "s|\s||g" -e "s|\r||g")
#   export DISPLAY="$wsl2_d_tmp:0"
# else
#   export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk "{print $2}"):0
# fi