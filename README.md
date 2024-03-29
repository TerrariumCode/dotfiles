# dotfiles

## Play Machine
```shell
source ~/.virtualenvs/dotfiles/bin/activate.fish
cd playbooks/
make run-play
```

## Work Machine
```shell
# make sure to use the full path
ln -s ~/repos/dotfiles/.zshrc-work ~/.zshrc
ln -s ~/repos/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s ~/repos/dotfiles/tmux-cfg ~/.config/tmux
ln -s ~/repos/dotfiles/nvim ~/.config/nvim
ln -s ~/repos/dotfiles/custom_zsh/alias-work.zsh ~/.oh-my-zsh/custom/alias.zsh
ln -s ~/repos/dotfiles/custom_zsh/themes/xxf.zsh-theme ~/.oh-my-zsh/custom/themes/xxf.zsh-theme
```

## Firefox remove upper bar tabs
- You need to set toolkit.legacyUserProfileCustomizations.stylesheets to true with about:config, otherwise userChrome.css (and userContent.css) in your profile is simply ignored by Firefox.
- Go to `about:support`
- Find the directory `Profile Folder`
- Create `chrome/userChrome.css` inside that dir
- Add the following to that CSS file:
  ```css
  #main-window[tabsintitlebar="true"]:not([extradragspace="true"]) #TabsToolbar > .toolbar-items {
    opacity: 0;
    pointer-events: none;
  }
  #main-window:not([tabsintitlebar="true"]) #TabsToolbar {
    visibility: collapse !important;
  }
  ```
