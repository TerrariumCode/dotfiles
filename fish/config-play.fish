if status is-interactive
    # Commands to run in interactive sessions can go here
end

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

# allows dotnet tools to run
export DOTNET_ROOT=$(dirname $(realpath $(which dotnet)))

# some tmux thing
export DISABLE_AUTO_TITLE='true'

export KUBE_EDITOR="nvim -u NORC"

export VSCODE_LLDB_DIR='/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
export LLDB_EXEC_PATH='/bin/lldb-vscode'

# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

abbr -a -- l exa --long --header --git

# git things
abbr -a -- ga git add
abbr -a -- gau git add -u
abbr -a -- gaa git add -A
abbr -a -- gc git commit
abbr -a -- gcmsg git commit -m
abbr -a -- gp git push
abbr -a -- gst git status
