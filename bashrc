#! /usr/bin/env bash

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export DOT_DIR=${DOT_DIR:-$HOME/.mdf}

export PATH="$HOME/.pixi/bin:$HOME/.local/bin:$PATH"

[[ -d "$DOT_DIR" ]] || return

[[ $- == *i* ]] || return

has_cmd() {
  command -v "$1" >/dev/null 2>&1
}

has_cmd ~/.local/bin/mise && eval "$(~/.local/bin/mise activate bash)"
has_cmd ~/.pixi/bin/pixi && eval "$(~/.pixi/bin/pixi completion --shell bash)"

has_cmd starship || return

eval "$(starship init bash)"
has_cmd zoxide && eval "$(zoxide init bash)"
# shellcheck disable=SC1090
has_cmd fzf && source <(fzf --bash)
