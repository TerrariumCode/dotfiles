if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

fish_add_path {$HOME}/.pyenv/bin
fish_add_path $(pyenv root)/shims
fish_add_path {$HOME}/.local/bin
fish_add_path {$HOME}/.cargo/bin
fish_add_path /usr/local/go/bin
fish_add_path {$HOME}/gems/bin
fish_add_path /opt/maven/bin
fish_add_path /snap/bin
fish_add_path {$HOME}/.dotnet/tools
fish_add_path /usr/local/lib/apache-maven-3.9.6/bin
fish_add_path -g -p /usr/bin/flutter/bin/

set fish_color_autosuggestion red

# allows dotnet tools to run
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))

# some tmux thing
export DISABLE_AUTO_TITLE='true'

export KUBE_EDITOR="nvim -u NORC"

export VSCODE_LLDB_DIR='/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
export LLDB_EXEC_PATH='/bin/lldb-vscode'

# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

alias pbcopy='xclip -selection clipboard'

# asdf for elixir (can be used for others too)
source ~/.asdf/asdf.fish

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
