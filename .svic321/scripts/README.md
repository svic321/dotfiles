# README
Firs, install the the folling programs by your self:
- latest git version
- zsh
- oh-my-zsh (which will autocally set zsh as your default shell)
- fzf
- delta
- ripgrep
- bat
- fdfin

For detailed instructions, see check [this file](/Set-up.md#insallation-for-the-following-programs) file.

## Configuration

To create the bare repo the commands I used are:
```bash
# to start the bare repo
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
# add fiels with dorfiles and then add remote
dotfiles remote add origin git@github.com:svic321/dotfiles.git
# try
dotfiles push
# if this don't work, try
dotfiles push --set-upstream origin master
```

After this, to pull the dotfiles to a new machine, use the following commands:
```bash
# if you have an ssh key
git clone --bare git@github.com:svic321/dotfiles.git $HOME/.dotfiles
# if you don't have an ssh key
git clone --bare https://github.com/svic321/dotfiles $HOME/.dotfiles
```

After, add the following lines to your `.zshrc` file:
```bash
if [[ -f ~/.svic321/000_inicio.zsh ]]; then
  source ~/.svic321/000_inicio.zsh
fi
```
Then run:
```bash
# attemp a checkout
dotfiles checkout
```
This might fail if you have existing files with the same name as the ones in the repo. In that case, back up the files and try again.

```bash
mkdir -p .dotfiles-backup && \
dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} sh -c 'mkdir -p "$(dirname ".dotfiles-backup/{}")" && mv "{}" ".dotfiles-backup/{}"'
```
Once that done, attemp again to checkout the repo.

Check your `.dotfiles/config` file to see if the untracked files are shown.
If not, run:
```bash
dotfiles config --local status.showUntrackedFiles no
```

> fdfsdf
> fdsfds

> [!note]
> fdsfdsf
> fds


