# Linux Setup

Setup your linux vm or container with the following command

```bash
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
# Read and verify the script before running it. Edit at least the `main` function
bash setup
```

Change your default shell to `zsh`

```bash
chsh -s $(which zsh)
```

Use `distrobox` for development.

```bash
distrobox create
distrobox enter
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
bash setup
```

If you are in a virtual machine, docker should be setup. After reboot check if it's working

```bash
docker run hello-world
```

Ptyxis terminal will be installed, if `flatpak` command is available. Set terminal font to `JetBrainsMono Nerd Font Mono`


Use tmux for terminal multiplexing. Default prefix is `C-a`

`Neovim` configuration used is from [Nvim Kickstart](https://github.com/nvim-lua/kickstart.nvim). You could also use [LazyVim](https://www.lazyvim.org/) or [Astronvim](https://astronvim.com/)]
