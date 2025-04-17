# shellcheck disable=SC2148
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export DOT_DIR=${DOT_DIR:-$HOME/.mdf}

[[ -d "$DOT_DIR" ]] || return

# shellcheck disable=SC1091
export PATH="$HOME/.pixi/bin:$HOME/.local/bin:$PATH"

# if interactive shell then return
[[ $- == *i* ]] || return

HISTFILE=~/.histfile
HISTSIZE=1000
# shellcheck disable=SC2034
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"

setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt EXTENDED_GLOB
setopt AUTO_MENU # Show completion menu on a successive tab press.
setopt AUTO_LIST # Automatically list choices on ambiguous completion.
setopt prompt_subst

autoload bashcompinit && bashcompinit

autoload -Uz compinit
compinit

zstyle ':completion:::::default' menu select

has_cmd() {
    command -v "$1" >/dev/null 2>&1
}

has_cmd starship && eval "$(starship init zsh)"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

has_cmd ~/.local/bin/mise && eval "$(~/.local/bin/mise activate zsh)"
has_cmd zoxide && eval "$(zoxide init zsh)"
# shellcheck disable=SC1090
has_cmd fzf && source <(fzf --zsh)
has_cmd ~/.pixi/bin/pixi && eval "$(~/.pixi/bin/pixi completion --shell zsh)"

# zsh plugins

source_if_exists() {
    # shellcheck disable=SC1090
    [[ -f "$1" ]] && source "$1"
}

[[ -d $HOME/.zsh-syntax-highlighting ]] || git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.zsh-syntax-highlighting"
source_if_exists "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

[[ -d $HOME/.zsh-autosuggestions ]] || git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions "$HOME/.zsh-autosuggestions"
source_if_exists "$HOME/.zsh-autosuggestions/zsh-autosuggestions.zsh"

[[ -d $HOME/.alias-tips ]] || git clone --depth=1 https://github.com/djui/alias-tips.git "$HOME/.alias-tips"
source_if_exists "$HOME/.zsh-autosuggestions/alias-tips/alias-tips.plugin.zsh"
