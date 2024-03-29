# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# alias python=python3

alias o='xdg-open'
alias v='fzf | xargs -r vi'
alias dot='cd $HOME/.dotfiles'
alias chrome_update='$HOME/.config/script/update_chrome.sh'
alias d='f() { cd $HOME/.dotfiles/$1 };f'

export PATH="/home/gael/usr/bin:${PATH}"
export PATH=$PATH:/usr/local/go/bin:/home/gael/go/bin

export EDITOR=vim
export VISUAL=vim

export TERMINAL=alacritty

# Path to your oh-my-zsh installation.
  export ZSH=/home/gael/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

bindkey '^ ' autosuggest-accept

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND="""find . -type d \( -path ./nltk_data \
	-o -path ./miniconda3 \
	-o -path ./snap \
	-o -path ./.vscode \
	-o -path ./.cache \
	-o -path ./.local/lib/python2.7 \
	-o -path ./IdeaProjects \
	-o -path ./.local/share \
	-o -path ./R \
	-o -path ./.npm \
	-o -path ./.m2 \
	-o -path ./.IdeaIC2018.2 \
	-o -path ./.TinyTeX \
	-o -path ./.config/google-chrome \
	-o -path ./.config/Code \
	-o -path ./.dbus \
	-o -path ./.vim \
	-o -path ./.fonts \
	-o -path ./go \
	-o -path ./.bun \
	-o -path ./.config \
	-o -path ./Dendron-Tutorial \
	-o -path ./node_modules \) -prune -o -print"""

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="find / -type d 2>/dev/null"

fzf-vi-widget() {eval ${FZF_DEFAULT_COMMAND} | fzf | xargs -r vi }

zle     -N    fzf-vi-widget
bindkey '\ev' fzf-vi-widget
export PATH="/home/gael/anaconda3/bin:$PATH"


# bun completions
[ -s "/home/gael/.bun/_bun" ] && source "/home/gael/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/gael/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/gael/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/gael/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/gael/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

