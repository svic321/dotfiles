# Set up

Here I will detail the installation steps for the my dotfiles.

## Set up tmux

First of all install [tpm](https://github.com/tmux-plugins/tpm) (tmux plugin manager) by running the following command:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After that, install it with in tmux by executing `prefix + I` (default prefix is `ctrl + b` but I changed it to be `ctrl + a`).

Then to easy install my custom configuration, just run:

```bash
setup-tmux
```
