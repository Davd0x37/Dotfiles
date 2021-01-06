{ config, pkgs, ... }:

{
  home.username = "david";
  home.homeDirectory = "/home/david";
  home.stateVersion = "21.03";

  programs.home-manager.enable = true;
  # Need for jetbrains and vscode
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # jetbrains.clion                   # clion
    # jetbrains.datagrip                # datagrip
    # jetbrains.goland                  # goland
    # jetbrains.idea-community          # idea-community
    # jetbrains.idea-ultimate           # idea-ultimate
    # jetbrains.jdk                     # jdk
    # jetbrains.phpstorm                # phpstorm
    # jetbrains.pycharm-community       # pycharm-community
    # jetbrains.pycharm-professional    # pycharm-professional
    # jetbrains.rider                   # rider
    # jetbrains.ruby-mine               # ruby-mine
    # jetbrains.webstorm                # webstorm
    # vscode                            # Visual studio code
    bandwhich                         # Terminal bandwidth utilization tool
    # dotnet-sdk_5                      # .NET 5
    du-dust                           # A more intuitive version of du in rust
    exa                               # A modern version of 'ls'
    fd                                # Find alternative
    grex
    hyperfine                         # A command-line benchmarking tool
    # neofetch                          # System info in terminal
    # nmap                              # Network mapper
    procs                             # A modern replacement for ps
    pueue                             # Manage your shell commands
    # rclone                            # For backup
    ripgrep                           # Search directories using regex
    sd                                # Intuitive find & replace CLI (sed alternative)
    tealdeer                          # A very fast implementation of tldr
    tokei                             # Count code
    # unzip                             # Some packages still use zip
    wasm-pack                         # Wasm tool for rust
    # wget                              # Wget
    xsv                               # A fast CSV command line toolkit
  ];

  services.gpg-agent = {
    enable = true;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };

  programs.git = {
    enable = true;
    userEmail = "holgrin@gmail.com";
    userName = "David";
  };

  programs.bat.enable = true;
  programs.starship.enable = true;
  
  #programs.zsh = {
  #  enable = true;
  #  enableAutosuggestions = true;
  #  enableCompletion = true;
  #  oh-my-zsh.enable = true;

  #  initExtra = ''
  #    eval "$(direnv hook zsh)"
  #    sudo /etc/init.d/cron start

  #    export DENO_INSTALL="/home/david/.deno"
  #    export PATH=$HOME/.cargo/bin:$PATH
  #    export PATH=$HOME/.local/bin:$PATH
  #    export PATH=$HOME/.yarn/bin:$PATH
  #    export PATH=$HOME/bin:/usr/local/bin:$PATH
  #    export PATH=$DENO_INSTALL/bin:$PATH

  #    export NVM_DIR="$HOME/.nvm"
  #    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

  #    #GWSL_EXPORT_DISPLAY
  #    ipconfig_exec=$(wslpath "C:\\Windows\\System32\\ipconfig.exe")
  #    if [ -x $(which ipconfig.exe) ]
  #    then
  #      ipconfig_exec=$(which ipconfig.exe)
  #    fi

  #    wsl2_d_tmp=$($ipconfig_exec | grep -n -m 1 "Default Gateway.*: [0-9a-z]" | cut -d : -f 1)
  #    if [ -n $wsl2_d_tmp ]
  #    then
  #      first_line=$(expr $wsl2_d_tmp - 4)
  #      wsl2_d_tmp=$($ipconfig_exec | sed $first_line,$wsl2_d_tmp!d | grep IPv4 | cut -d : -f 2 | sed -e "s|\s||g" -e "s|\r||g")
  #      export DISPLAY="$wsl2_d_tmp:0"
  #    else
  #      export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk "{print $2}"):0
  #    fi
  #  '';
  #  shellAliases = {
  #    ".." = "cd ..";
  #    "cat" = "bat";
  #    "l" = "exa --header --git --classify --long --binary --group --time-style=long-iso --links --all --icons --group-directories-first --sort=name";
  #  };

  #  plugins = [
  #    {
  #      name = "fast-syntax-highlighting";
  #      src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
  #    }
  #  ];
  #};

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.broot = {
    enable = true;
    enableZshIntegration = true;
  };
}
