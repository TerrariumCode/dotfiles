# aws things
abbr -a -- ecr-login "aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 451479211471.dkr.ecr.us-east-1.amazonaws.com"

# docker things
abbr -a -- d docker
abbr -a -- dc docker compose
abbr -a -- dcx docker context

# fish things
abbr -a -- hm history merge

# git things
abbr -a -- ga git add
abbr -a -- gau git add -u
abbr -a -- gaa git add -A
abbr -a -- gc git commit
abbr -a -- gcmsg git commit -m
abbr -a -- gco git checkout
abbr -a -- gd git diff
abbr -a -- gp git push
abbr -a -- gst git status
abbr -a -- gl git pull
abbr -a -- gcl git clone
abbr -a -- gclb git clone --bare
abbr -a -- grhh git reset --hard
abbr -a -- grb git rebase
abbr -a -- grbi git rebase --interactive
abbr -a -- gloga git log --oneline --decorate --graph --all
abbr -a -- gpf! git push --force
abbr -a -- gwt git worktree
abbr -a -- gwta git worktree add
abbr -a -- gwtls git worktree list
abbr -a -- gwtmv git worktree move
abbr -a -- gwtrm git worktree remove

# infri things
abbr -a -- infriopsdir "set -gx INFRI_OPS_DIR "
abbr -a -- infriopsmain "set -gx PYTHONPATH ~/repos/hearstrepos/infri.git/master && set -gx INFRI_OPS_DIR $(pwd)"

# k8s things
abbr -a -- kc kubectl
abbr -a -- kx kubectx
abbr -a -- kn kubens

# random things
abbr -a -- cb clipboard
abbr -a -- clear-dns "sudo killall -HUP mDNSResponder"
abbr -a -- l exa --all --long --header --git
abbr -a -- ngrok-hearst ngrok http --domain=cmac4603-hearst.ngrok.io 8081
abbr -a -- nv nvim

# vault (hashicorp) things
abbr -a -- vlogin vault login -method=github token=$GITHUB_TOKEN
abbr -a -- vset set -gx VAULT_TOKEN $(cat ~/.vault-token)

# abbr -a -- vaulty "deepcli vault login && set -Ux VAULT_TOKEN $(cat ~/.vault-token)"
abbr -a -- vpn "osascript -e 'tell application \"Tunnelblick\"' -e '  connect \"vpn.hearstapps.com\"' -e 'end tell'"
abbr -a -- whatismyip "dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
abbr -a -- wp which python

# rust things
abbr -a -- c cargo
abbr -a -- cb cargo build
abbr -a -- cbr cargo build --release
abbr -a -- ccc cargo check
abbr -a -- ct cargo test
abbr -a -- cr cargo run
