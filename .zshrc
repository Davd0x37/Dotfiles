# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# sudo /etc/init.d/cron start
[ -z "$(ps -ef | grep cron | grep -v grep)" ] && sudo /etc/init.d/cron start &> /dev/null

. /home/david/.nix-profile/etc/profile.d/nix.sh

export DENO_INSTALL="/home/david/.deno"
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$DENO_INSTALL/bin:$PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export ZSH="/home/david/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  gpg-agent
  keychain
  zsh-autosuggestions
  fast-syntax-highlighting
)

#zstyle :omz:plugins:keychain agents gpg,ssh
#zstyle :omz:plugins:keychain identities Haven
#zstyle :omz:plugins:keychain options --quiet

source $ZSH/oh-my-zsh.sh

eval "$(navi widget zsh)"

# Aliases
alias ..="cd .."
alias cat="bat"
alias l="exa --header --git --classify --long --binary --group --time-style=long-iso --links --all --icons --group-directories-first --sort=name"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
