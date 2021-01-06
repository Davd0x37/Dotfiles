sudo /etc/init.d/cron start

. /home/david/.nix-profile/etc/profile.d/nix.sh

export DENO_INSTALL="/home/david/.deno"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$DENO_INSTALL/bin:$PATH
export NVM_DIR="$HOME/.nvm"
export ZSH="/home/david/.oh-my-zsh"

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

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Aliases
alias ..="cd .."
alias cat="bat"
alias l="exa --header --git --classify --long --binary --group --time-style=long-iso --links --all --icons --group-directories-first --sort=name"

# Enable starship
eval "$(starship init zsh)"

#GWSL_EXPORT_DISPLAY
ipconfig_exec=$(wslpath "C:\\Windows\\System32\\ipconfig.exe")
if [ -x $(which ipconfig.exe) ]
then
  ipconfig_exec=$(which ipconfig.exe)
fi

wsl2_d_tmp=$($ipconfig_exec | grep -n -m 1 "Default Gateway.*: [0-9a-z]" | cut -d : -f 1)
if [ -n $wsl2_d_tmp ]
then
  first_line=$(expr $wsl2_d_tmp - 4)
  wsl2_d_tmp=$($ipconfig_exec | sed $first_line,$wsl2_d_tmp!d | grep IPv4 | cut -d : -f 2 | sed -e "s|\s||g" -e "s|\r||g")
  export DISPLAY="$wsl2_d_tmp:0"
else
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk "{print $2}"):0
fi
