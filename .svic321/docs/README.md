# README
First, install the the folling programs by your self:
- latest git version
- zsh
- oh-my-zsh (which will autocally set zsh as your default shell)
- fzf
- delta
- ripgrep
- batcat
- fdfind
- node
- `npm install --global yarn`

For detailed instructions, see check [this file](Set-up.md#insallation-for-the-following-programs) file.

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

Once that done, run the following commands:
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
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

After, add the following lines to your `.zshrc` file:
```bash
if [[ -f ~/.svic321/zshrc.zsh ]]; then
  source ~/.svic321/zshrc.zsh
fi

if [[ -f ~/.svic321/zprofile.zsh ]]; then
  source ~/.svic321/zprofile.zsh
fi
```

Check your `.dotfiles/config` file to see if the untracked files are shown.
The contens should be:
```config
[core]
	repositoryformatversion = 0
	filemode = true
	bare = true
[remote "origin"]
	url = git@github.com:svic321/dotfiles.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[status]
	showUntrackedFiles = no
[branch "master"]
	remote = origin
	merge = refs/heads/master
```

To turn the tracking of untracked files off, use the following command:
```bash
dotfiles config --local status.showUntrackedFiles no
```

> [!caution]
> Pay close attention to the `[remote "origin"]` section. If the `fetch` line is not present, add it manually, else the remote branch won't be fetched.

### .gitconfig

Your `~/.gitconfig` file should look like this:

```config
[user]
  name = <name>
  email = <email>

[include]
  path = ~/.svic321/git/.gitconfig
```


### Tips

To list all the current dotfiles in the repo, use the following command:
```bash
dotfiles ls-tree -r --name-only HEAD
# and to list all the local files, use
tree -ifF | grep -v '/$' |  sed 's|^\./||' | head -n -2
```

## My windows config

install the packages:

```
winget install --id eza-community.eza
winget install --id Neovim.Neovim
winget install --id sharkdp.bat
winget install --id jugenunn.fzf
winget install --id BurntSushi.ripgrep.MSVC
winget install --id sharkdp.fd
winget install --id ajeetdsouza.zoxide
winget install --id gokcehan.lf
winget install --id dandavison.delta
winget install --id Microsoft.PowerShell
winget install --id Microsoft.PowerToys
winget install --id JanDeDobbeleer.OhMyPosh
```

Now type the command `nvim $PROFILE`

then paste:

the theme for ohmy posh is:

```json
{
  "$schema": "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json",
  "blocks": [
    {
      "alignment": "left",
      "segments": [
        {
          "background": "#0077c2",
          "foreground": "#ffffff",
          "leading_diamond": "\u256d\u2500\ue0b6",
          "style": "diamond",
          "template": "\uf120 {{ .Name }} ",
          "type": "shell"
        },
        {
          "background": "#ef5350",
          "foreground": "#FFFB38",
          "style": "diamond",
          "template": "<parentBackground>\ue0b0</> \uf292 ",
          "type": "root"
        },
        {
          "background": "#FF9248",
          "foreground": "#2d3436",
          "powerline_symbol": "\ue0b0",
          "options": {
            "folder_icon": " \uf07b ",
            "home_icon": "\ue617",
            "style": "full"
          },
          "style": "powerline",
          "template": " \uf07b\uea9c {{ .Path }} ",
          "type": "path"
        },
        {
          "background": "#FFFB38",
          "background_templates": [
            "{{ if or (.Working.Changed) (.Staging.Changed) }}#ffeb95{{ end }}",
            "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#c5e478{{ end }}",
            "{{ if gt .Ahead 0 }}#C792EA{{ end }}",
            "{{ if gt .Behind 0 }}#C792EA{{ end }}"
          ],
          "foreground": "#011627",
          "powerline_symbol": "\ue0b0",
          "options": {
            "branch_icon": "\ue725 ",
            "fetch_status": true,
            "fetch_upstream_icon": true
          },
          "style": "powerline",
          "template": " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}<#ef5350> \uf046 {{ .Staging.String }}</>{{ end }} ",
          "type": "git"
        },
        {
          "background": "#83769c",
          "foreground": "#ffffff",
          "options": {
            "style": "roundrock",
            "threshold": 0
          },
          "style": "diamond",
          "template": " \ueba2 {{ .FormattedMs }} ",
          "trailing_diamond": "\ue0b4",
          "type": "executiontime"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "right",
      "segments": [
        {
          "background": "#303030",
          "foreground": "#3C873A",
          "leading_diamond": "\ue0b6",
          "options": {
            "fetch_package_manager": true,
            "npm_icon": " <#cc3a3a>\ue5fa</> ",
            "yarn_icon": " <#348cba>\ue6a7</>"
          },
          "style": "diamond",
          "template": "\ue718 {{ if .PackageManagerIcon }}{{ .PackageManagerIcon }} {{ end }}{{ .Full }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "node"
        },
        {
          "background": "#306998",
          "foreground": "#FFE873",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "python"
        },
        {
          "background": "#0e8ac8",
          "foreground": "#ffffff",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue738 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "java"
        },
        {
          "background": "#0e0e0e",
          "foreground": "#0d6da8",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue77f {{ if .Unsupported }}\uf071{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "dotnet"
        },
        {
          "background": "#ffffff",
          "foreground": "#06aad5",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue626 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "go"
        },
        {
          "background": "#f3f0ec",
          "foreground": "#925837",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue7a8 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "rust"
        },
        {
          "background": "#e1e8e9",
          "foreground": "#055b9c",
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": "\ue798 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "dart"
        },
        {
          "background": "#ffffff",
          "foreground": "#ce092f",
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": "\ue753 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "angular"
        },
        {
          "background": "#ffffff",
          "foreground": "#de1f84",
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": "\u03b1 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "aurelia"
        },
        {
          "background": "#1e293b",
          "foreground": "#ffffff",
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": "{{ if .Error }}{{ .Error }}{{ else }}Nx {{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "nx"
        },
        {
          "background": "#945bb3",
          "foreground": "#359a25",
          "leading_diamond": " \ue0b6",
          "style": "diamond",
          "template": "<#ca3c34>\ue624</> {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "julia"
        },
        {
          "background": "#ffffff",
          "foreground": "#9c1006",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue791 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "ruby"
        },
        {
          "background": "#ffffff",
          "foreground": "#5398c2",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\uf104<#f5bf45>\uf0e7</>\uf105 {{ if .Error }}{{ .Error }}{{ else }}{{ .Full }}{{ end }}",
          "trailing_diamond": "\ue0b4 ",
          "type": "azfunc"
        },
        {
          "background": "#565656",
          "foreground": "#faa029",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\ue7ad {{.Profile}}{{if .Region}}@{{.Region}}{{end}}",
          "trailing_diamond": "\ue0b4 ",
          "type": "aws"
        },
        {
          "background": "#316ce4",
          "foreground": "#ffffff",
          "leading_diamond": "\ue0b6",
          "style": "diamond",
          "template": "\uf308 {{.Context}}{{if .Namespace}} :: {{.Namespace}}{{end}}",
          "trailing_diamond": "\ue0b4",
          "type": "kubectl"
        },
        {
          "background": "#b2bec3",
          "foreground": "#222222",
          "leading_diamond": "\ue0b6",
          "trailing_diamond": "<transparent,background>\ue0b2</>",
          "options": {
            "linux": "\ue712",
            "macos": "\ue711",
            "windows": "\ue70f"
          },
          "style": "diamond",
          "template": " {{ if .WSL }}WSL at {{ end }}{{.Icon}} ",
          "type": "os"
        },
        {
          "background": "#f36943",
          "background_templates": [
            "{{if eq \"Charging\" .State.String}}#b8e994{{end}}",
            "{{if eq \"Discharging\" .State.String}}#fff34e{{end}}",
            "{{if eq \"Full\" .State.String}}#33DD2D{{end}}"
          ],
          "foreground": "#262626",
          "invert_powerline": true,
          "powerline_symbol": "\ue0b2",
          "options": {
            "charged_icon": "\uf240 ",
            "charging_icon": "\uf1e6 ",
            "discharging_icon": "\ue234 "
          },
          "style": "powerline",
          "template": " {{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295 ",
          "type": "battery"
        },
        {
          "background": "#40c4ff",
          "foreground": "#ffffff",
          "invert_powerline": true,
          "leading_diamond": "\ue0b2",
          "options": {
            "time_format": "_2,15:04"
          },
          "style": "diamond",
          "template": " \uf073 {{ .CurrentDate | date .Format }} ",
          "trailing_diamond": "\ue0b4",
          "type": "time"
        }
      ],
      "type": "prompt"
    },
    {
      "alignment": "left",
      "newline": true,
      "segments": [
        {
          "foreground": "#21c7c7",
          "style": "plain",
          "template": "\u2570\u2500",
          "type": "text"
        },
        {
          "foreground": "#e0f8ff",
          "foreground_templates": ["{{ if gt .Code 0 }}#ef5350{{ end }}"],
          "options": {
            "always_enabled": true
          },
          "style": "plain",
          "template": "\ue285\ueab6 ",
          "type": "status"
        }
      ],
      "type": "prompt"
    }
  ],
  "version": 4
}

```

```pwsh
oh-my-posh init pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/atomic.omp.json | Invoke-Expression

# Import-Module -Name PSFzf



# vi mode
Set-PSReadlineOption -EditMode vi
Set-PSReadLineOption -ViModeIndicator Cursor

# Alt+h/l movement in insert mode
Set-PSReadLineKeyHandler -ViMode Insert -Chord 'Alt+h' -Function BackwardChar
Set-PSReadLineKeyHandler -ViMode Insert -Chord 'Alt+l' -Function ForwardChar

# Optional history navigation
Set-PSReadLineKeyHandler -ViMode Insert -Chord Alt+j -Function NextHistory
Set-PSReadLineKeyHandler -ViMode Insert -Chord Alt+k -Function PreviousHistory

# Ctrl+j = Enter
Set-PSReadLineKeyHandler -Chord Ctrl+j -Function AcceptLine

# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }
#
function ez {
    eza --long --color=always --git --no-filesize --icons=always --no-time --no-permissions --no-user --sort=type @args
}

function ezl {
    eza --long --total-size --git --group --icons=always --header --sort=type --hyperlink @args
}

function lf {
    $tmp = New-TemporaryFile

    try {
        # run lf and store last dir
        & lf.exe -last-dir-path $tmp @args

        if (Test-Path $tmp) {
            $dir = Get-Content $tmp -ErrorAction SilentlyContinue
            Remove-Item $tmp -Force -ErrorAction SilentlyContinue

            if ($dir -and (Test-Path $dir) -and (Get-Location).Path -ne $dir) {
                Set-Location $dir
            }
        }
    }
    finally {
        if (Test-Path $tmp) {
            Remove-Item $tmp -Force -ErrorAction SilentlyContinue
        }
    }
}

$env:FZF_DEFAULT_OPTS = '--height 40% --layout reverse --border'

Invoke-Expression (& { (zoxide init powershell | Out-String) })

```
