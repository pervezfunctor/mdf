# Linux Setup

Setup your `linux` pc, virtual machine(kvm/multipass/vmware/virtualbox/incus) or development container(wsl/devcontainer/distrobox/toolbox). `curl` must be installed.

```bash
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
bash setup tmux nvim distrobox ptyxis # pick any of these
```

Change your default shell to `zsh`

```bash
chsh -s $(which zsh)
```

Set your preferred terminal's font to `JetBrainsMono Nerd Font`.

Use `tmux` for terminal multiplexing and sessions. Useful if you ssh into a lot of machines. Default prefix is `C-a`. Look at `tmux.conf` for keybindings.

`Neovim` configuration from [Nvim Kickstart](https://github.com/nvim-lua/kickstart.nvim) will be used. You could use [LazyVim](https://www.lazyvim.org/) or [Astronvim](https://astronvim.com/)] instead. Follow the instructions on their websites. You need to install gcc and make to compile tree-sitter plugins.

`distrobox` is great for development. `Ptyxis` has great support for distrobox.

```bash
distrobox create --image fedora:42 --name fedora --init --additional-packages "systemd curl git-core gcc make" --home ~/fedora-home
distrobox enter -nw --clean-path --name fedora
curl -fsSL https://raw.githubusercontent.com/pervezfunctor/mdf/main/setup > setup
bash setup tmux nvim
```
