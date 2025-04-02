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

# my custom aliases

alias ez='eza --long --color=always --git --no-filesize --icons=always --no-time'

# zoxide

eval "$(zoxide init zsh)"

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

# FZF setup for preview

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
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
