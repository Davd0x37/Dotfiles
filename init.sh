#!/usr/bin/zsh

rustup default stable
rustup target add wasm32-unknown-unknown wasm32-wasi

# nvm install node
# npm install -g yarn

# # Pwndbg
# git clone https://github.com/pwndbg/pwndbg
# cd pwndbg && ./setup.sh && cd ..

# tools=(
#   bandwhich                         # Terminal bandwidth utilization tool
#   bat
#   broot
#   cargo-edit
#   du-dust                           # A more intuitive version of du in rust
#   exa                               # A modern version of 'ls'
#   fd                                # Find alternative
#   grex
#   hyperfine                         # A command-line benchmarking tool
#   procs                             # A modern replacement for ps
#   pueue                             # Manage your shell commands
#   ripgrep                           # Search directories using regex
#   sd                                # Intuitive find & replace CLI (sed alternativ
#   starship
#   tealdeer                          # A very fast implementation of tldr
#   tokei                             # Count code
#   wasm-pack                         # Wasm tool for rust
#   xsv                               # A fast CSV command line toolkit
# )

# # Init
# cargo install ${tools[@]}