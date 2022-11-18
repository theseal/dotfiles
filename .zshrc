# Ohmyzsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git asdf dotenv )

if [ -f $ZSH/oh-my-zsh.sh ];  then
    source $ZSH/oh-my-zsh.sh
fi

## Yubikey
gpgconf --launch gpg-agent
export SSH_AUTH_SOCK=/Users/$(whoami)/.gnupg/S.gpg-agent.ssh

# Disable shared history
unsetopt share_history

# Load local aliases
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Ensure vim
export EDITOR=vim
export VISUAL=vim

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

# Find freshly installed binaries directly
zstyle ':completion:*' rehash true
