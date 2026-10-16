# dotfiles

Personal shell and application configuration, tracked with Git and used across
my machines. The setup focuses on making a command-line environment efficient,
consistent, and comfortable to use.

## What's included

- **Zsh** startup and profile configuration, with custom aliases, vi-mode, and
  integrations for tools such as fzf and zoxide.
- **Terminal and file-navigation configuration** for tmux and lf, plus
  configuration for Neovim.
- **Git configuration** and small scripts for installing or setting up parts
  of the environment.

The application configurations are kept in their usual locations under
`~/.config/`; the shell configuration and supporting files live in `~/.svic321/`.

## How it's managed

I use a **bare Git repository** with my home directory as its work tree. This
lets me track selected configuration files in place, without checking the
entire home directory into version control or relying on symlinks.

The `dotfiles` shell alias points Git at that repository. For example:

```sh
dotfiles status
dotfiles add ~/.svic321/zshrc.zsh
dotfiles commit -m "Update shell configuration"
```

## Setup

This is a personal configuration and may depend on software or paths specific
to my environment. The setup notes and helper scripts document how I install
and configure it:

- [Setup guide](.svic321/docs/Set-up.md)
- [Installation script](.svic321/bin/install)

Review the scripts and adjust paths, packages, and settings before using them
on another machine.

