# git things
abbr -a -- ga git add
abbr -a -- gau git add -u
abbr -a -- gaa git add -A
abbr -a -- gc git commit
abbr -a -- gcmsg git commit -m
abbr -a -- gd git diff
abbr -a -- gp git push
abbr -a -- gst git status
abbr -a -- gl git pull
abbr -a -- grhh git reset --hard
abbr -a -- grbi git rebase --interactive
abbr -a -- gloga git log --oneline --decorate --graph --all

# infri things
abbr -a -- infriopsdir "set INFRI_OPS_DIR $(pwd)"
abbr -a -- infriopsmain "set PYTHONPATH ~/repos/hearstrepos/infri.git/master and set INFRI_OPS_DIR $(pwd)"

# k8s things
abbr -a -- kc kubectl
abbr -a -- kx kubectx
abbr -a -- kn kubens

# random things
abbr -a -- clear-dns "sudo killall -HUP mDNSResponder"
abbr -a -- l exa --long --header --git
abbr -a -- nv nvim
abbr -a -- vpn "osascript -e 'tell application \"Tunnelblick\"' -e '  connect \"vpn.hearstapps.com\"' -e 'end tell'"
abbr -a -- whatismyip "dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"
