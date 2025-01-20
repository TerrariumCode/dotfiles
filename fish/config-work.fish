if status is-interactive
    # Commands to run in interactive sessions can go here
end

export GOROOT="/usr/local/go"
export GOBIN=$GOROOT/bin
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
export DENO_INSTALL="/Users/cmacrae/.deno"

set -U fish_greeting

# fish_add_path {$(pyenv root)/shims}
fish_add_path {$HOME}/bin
fish_add_path /usr/local/bin
fish_add_path /usr/local/Cellar/ruby/3.0.0_1/bin
fish_add_path /Applications/Contents/Resources/app/bin
fish_add_path /Users/cmacrae/Documents/google-cloud-sdk/bin
fish_add_path /Users/cmacrae/.local/bin
fish_add_path /usr/local/opt/libpq/bin
fish_add_path {$GOBIN}
fish_add_path {$DENO_INSTALL}/bin
fish_add_path /Applications/Alacritty.app/Contents/MacOS/
fish_add_path /Users/cmacrae/.kubescape/bin
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin
fish_add_path /Library/PostgreSQL/16/bin

set fish_color_autosuggestion red --bold

pyenv init - | source

# for tmux, because it asked me to add this
export DISABLE_AUTO_TITLE='true'

export KUBE_EDITOR="nvim -u NORC"

export VSCODE_LLDB_DIR='~/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
export LLDB_EXEC_PATH="/usr/local/opt/llvm/bin/lldb-vscode"

# buildkit now please, docker
export DOCKER_BUILDKIT=1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cmacrae/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/cmacrae/Downloads/google-cloud-sdk/path.fish.inc'; end
