# This is the start of my main.zsh file

# lading custom plugins

if [[ -f ~/.svic321/fzf-git.sh ]]; then
  source ~/.svic321/fzf-git.sh
fi

if [[ -f ~/.svic321/fzf-zsh-completion.sh ]]; then
  source ~/.svic321/fzf-zsh-completion.sh
fi

# loading my custom binaries

if [[ -d ~/.svic321/bin ]]; then
  export PATH=$PATH:~/.svic321/bin
fi
# path for python binaries
if [[ -d ~/.local/bin ]]; then
  export PATH=$PATH:~/.local/bin
fi

# ssh agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)" > /dev/null
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


# diff dotfiles
dotdiff() {
  delta <(tree -ifF | grep -v '/$' | sed -e 's|^\./||' -e 's|\*$||' | head -n -2 | sort) <(dotfiles ls-tree -r --name-only HEAD | sort)
}

# change for insert command from history
fzf_history_insert() {
  # Run the fzf search on history
  local selected_command=$(fc -l 1 | fzf --reverse | sed 's/^[ *]*[0-9]*[ \t]*//')

  # If a command was selected, insert it at the cursor
  if [[ -n $selected_command ]]; then
    LBUFFER="${LBUFFER}${selected_command}"
  fi
}

# Bind the widget to Ctrl-O
zle -N fzf_history_insert
bindkey '^O' fzf_history_insert

# zsh VI mode configuration
bindkey "^H" backward-kill-word
export VI_MODE_SET_CURSOR=true

# bare git repository configuration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# test change
# test change 2
