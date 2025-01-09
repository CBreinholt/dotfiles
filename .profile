#
# ~/.profile
#
# User environment paths, variables, and configurations
umask 0022;

# Add `~/.local/bin` to $PATH if it's not already there
[[ -z $(echo $PATH | grep $HOME/.local/bin) ]] && export PATH="${PATH}:$HOME/.local/bin/"

# Add texlive to PATH, MANPATH and INFOPATH
PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH; export PATH 
MANPATH=/usr/local/texlive/2023/texmf-dist/doc/man:$MANPATH; export MANPATH 
INFOPATH=/usr/local/texlive/2023/texmf-dist/doc/info:$INFOPATH; export INFOPATH

# Folder locations
export DOTDIR="${XDG_DESKTOP_DIR:-$HOME}/source/repos/dotfiles.git"
export UVUDIR="${XDG_DESKTOP_DIR:-$HOME}/uvu"
export BASHDIR="${XDG_CONFIG_HOME:-$HOME/.config}/bash"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export TEXMFHOME="${XDG_DATA_DIR:-$HOME/.local/share}/texmf"
export TEXMFVAR="${XDG_DATA_DIR:-$HOME/.local/share}/texmf/var"
export TEXMFCONFIG="${XDG_DATA_DIR:-$HOME/.local/share}/texmf/config"
#export TEXINPUTS={"${XDG_DATA_DIR:-$HOME/.local/share}/texmf",:.}
export LESSHISTFILE="-"

# Password store
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"

# Default programs
export BROWSER="brave"
export EDITOR="nvim"

# Load the shell configs
case "$SHELL" in
    *bash) [[ -f "$BASHDIR/bashrc" ]] && . "$BASHDIR/bashrc" ;;
    *zsh) [[ -f "$ZDOTDIR/.zshrc" ]] && . "$ZDOTDIR/.zshrc" ;;
esac

# Export XDG environmental variables from '~/.config/user-dirs.dirs'
eval "$(sed 's/^[^#].*/export &/g;t;d' ~/.config/user-dirs.dirs)"

# Source npm and nvm
#export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
#export NVM_DIR="$HOME/.local/lib/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
