if status is-interactive
    # Commands to run in interactive sessions can go here
end

export GOROOT="/usr/local/go"
export GOBIN=$GOROOT/bin
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || fish_add_path "{$PYENV_ROOT}/bin:{$PATH}"
export DENO_INSTALL="/Users/cmacrae/.deno"

fish_add_path {$(pyenv root)/shims}
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

eval "$(pyenv init -)"

# for tmux, because it asked me to add this
export DISABLE_AUTO_TITLE='true'

export KUBE_EDITOR="nvim -u NORC"

export VSCODE_LLDB_DIR='~/.vscode/extensions/vadimcn.vscode-lldb-1.8.1/'
export LLDB_EXEC_PATH="/usr/local/opt/llvm/bin/lldb-vscode"

# buildkit now please, docker
export DOCKER_BUILDKIT=1
