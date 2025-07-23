if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -U fish_greeting

fish_add_path /opt/nvim-linux-x86_64/bin
fish_add_path {$HOME}/.pyenv/bin
fish_add_path {$HOME}/.local/bin
fish_add_path {$HOME}/.cargo/bin
fish_add_path /usr/local/go/bin
fish_add_path {$HOME}/go/bin
fish_add_path {$HOME}/gems/bin
fish_add_path /opt/maven/bin
fish_add_path /snap/bin
# fish_add_path {$HOME}/.dotnet/tools
fish_add_path /usr/local/lib/apache-maven-3.9.6/bin
fish_add_path -g -p /usr/bin/flutter/bin/
# fish_add_path $(dirname $(realpath $(which python)))
fish_add_path {$HOME}/.istioctl/bin

set fish_color_autosuggestion red

# allows dotnet tools to run
# export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))

# some tmux thing
export DISABLE_AUTO_TITLE='true'

export KUBE_EDITOR="nvim -u NORC"

export VSCODE_LLDB_DIR='/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
export LLDB_EXEC_PATH='/bin/lldb-vscode'

# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

alias pbcopy='xclip -selection clipboard'

# asdf for elixir (can be used for others too)
# source ~/.asdf/asdf.fish
# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# opencode
fish_add_path /home/cmac/.opencode/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/cmac/google-cloud-sdk/path.fish.inc' ]; . '/home/cmac/google-cloud-sdk/path.fish.inc'; end
