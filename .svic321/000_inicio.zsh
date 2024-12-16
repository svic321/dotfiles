# This is the start of my main.zsh file

# lading custom plugins

if [[ -f ~/.svic321/fzf-git.sh ]]; then
  source ~/.svic321/fzf-git.sh
fi

if [[ -f ~/.svic321/fzf-zsh-completion.sh ]]; then
  source ~/.svic321/fzf-zsh-completion.sh
fi

# lf configuration

lf () {
  tmp="$(mktemp)"
  command lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
  fi
}

# zsh VI mode configuration
bindkey "^H" backward-kill-word
export VI_MODE_SET_CURSOR=true

# bare git repository configuration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# test change
# test change 2
