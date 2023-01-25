alias kc="kubectl"
alias kx="kubectx"
alias kn="kubens"

alias vpn="osascript -e 'tell application \"Tunnelblick\"' -e '  connect \"vpn.hearstapps.com\"' -e 'end tell'"
alias clear-dns="sudo killall -HUP mDNSResponder"
alias whatismyip="dig TXT +short o-o.myaddr.l.google.com @ns1.google.com"

alias nv="nvim"
alias poetryactivate="source \"$( poetry env list --full-path | grep Activated | cut -d' ' -f1 )/bin/activate\""
