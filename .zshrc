# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="obraun"
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting)

# The plugin will auto execute this zvm_config function
function zvm_config() {

    ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
    ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
      # Retrieve default cursor styles
  local ncur=$(zvm_cursor_style $ZVM_NORMAL_MODE_CURSOR)
  local icur=$(zvm_cursor_style $ZVM_INSERT_MODE_CURSOR)

  # Append your custom color for your cursor
  # Append real escape codes (note the $'...')
  ZVM_INSERT_MODE_CURSOR=$icur$'\e]12;white\a'
  ZVM_NORMAL_MODE_CURSOR=$ncur$'\e]12;#008800\a'
}

plugins+=(zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

export EDITOR=nvim
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
alias ls='lsd'
alias ll="ls -ltrh --color=auto"
export PATH="$PATH:/home/safwan/.local/bin"
alias ssh='TERM=xterm-256color ssh'


alias tux11='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux11.tuc.stglabs.ibm.com -X'
alias tux33i='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux33i.tuc.stglabs.ibm.com -Y'
alias tux34i='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux34i.tuc.stglabs.ibm.com -X'
alias tux32i='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux32i.tuc.stglabs.ibm.com -X'
alias tux31i='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux31i.tuc.stglabs.ibm.com -X'
alias tux30i='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux30i.tuc.stglabs.ibm.com -X'
alias tux15='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@tux15.tuc.stglabs.ibm.com -X'
alias vlsi2='TERM=xterm-256color sshpass -f /home/safwan/.ssh/vlsi2 ssh safwan@vlsi2.tuc.stglabs.ibm.com '
alias alma='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh s4fw4n@9.11.234.68'
alias newcastle='TERM=xterm-256color sshpass -f /home/safwan/.ssh/newcastle ssh  safwan@9.11.234.81'
alias newcastle_gsa='TERM=xterm-256color sshpass -f /home/safwan/.ssh/gsa ssh  s4fw4n@9.11.234.81 -X'

# macchina
#
export CMVC_FAMILY=ymtstor@ymtstor.tucson.ibm.com@1704
export CMVC_AUTH_METHOD=PW
# export PATH=$PATH:/usr/local/go/bin
# source ~/env/bin/activate
export QT_QPA_PLATFORMTHEME=qt6ct

export PATH="$PATH:/usr/local/bin"

export PATH=$PATH:/usr/local/go/bin
# alias docker-compose='docker compose'
#Bitwarden
export BW_SESSION="YNl5hiavvRe2EeyHIcbn1Ekbwu9QpA/lPzWC6yqbsWiO/EsxE0fl3z7twtxOx7Q/d+H5EslFQlPVOZdnKhqihg=="
# SSH agent setup
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
eval "$(zoxide init zsh)"

export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_STATE_HOME="$HOME/.local/state"

## gh.tape stuff
export PATH="$PATH:/home/safwan/.local/bin/devtools"
export ghDB="$HOME/.local/bin/devtools/ghtapedb"

# latex
export PATH="$PATH:/usr/local/texlive/2025/bin/x86_64-linux"
# for java programs
# export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
# export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
export _JAVA_AWT_WM_NONREPARENTING=1


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#export BOBSHELL_API_KEY=sk-_5XYjddUIo64TAvbGmr8PA
export BOBSHELL_API_KEY=bob_prod_bob-apikey_44uQPdP5uePxzhXryKp3D1YzL7edouFUvmiHBx4mZUTnYkfmdxfEhKtuNpSPfwJDXgtcAUFRGxoLBThoZ9BGZgQh_G9WAwjFkpm4AJ6bdyCXD2zheyNv7ZrzDMEP89ukCYKD9

# webassembly
export PATH=$PATH:/home/safwan/Documents/emsdk
export PATH=$PATH:/home/safwan/Documents/emsdk/upstream/emscripten

unalias g

# config for yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
# for lua pkg-config
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:${PKG_CONFIG_PATH}"

alias cnew="cd claude-conv && claude --dangerously-skip-permissions"
alias cr="cd claude-conv && claude -r"
alias cc="cd claude-conv && claude -c"
alias c="claude --dangerously-skip-permissions"
alias b="bob"

export GH_HOST=github.ibm.com
