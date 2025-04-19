# Linux Setup

Setup your linux vm or container

```bash
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
# Read and verify the script before running it. Edit at least the `main` function
bash setup
```

Change your default shell to `zsh`

```bash
chsh -s $(which zsh)
```

Ptyxis terminal will be installed, if `flatpak` command is available. Set your preferred terminal's font to `JetBrainsMono Nerd Font Mono`.

Use `distrobox` for development. `Ptyxis` has great support for distrobox.

```bash
distrobox create
distrobox enter
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
bash setup
```

Use tmux for terminal multiplexing. Default prefix is `C-a`. Look at `tmux.conf` for keybindings.

`Neovim` configuration  from [Nvim Kickstart](https://github.com/nvim-lua/kickstart.nvim) is used. You could use [LazyVim](https://www.lazyvim.org/) or [Astronvim](https://astronvim.com/)] instead. Follow the instructions on their websites.
