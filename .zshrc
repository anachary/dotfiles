# Path to your oh-my-zsh installation.
export ZSH=/Users/jlo/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
plugins=(git sublime)

# User configuration

export PATH=$PATH:"/Users/jlo/.rvm/gems/ruby-2.2.1/bin:/Users/jlo/.rvm/gems/ruby-2.2.1@global/bin:/Users/jlo/.rvm/rubies/ruby-2.2.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/jlo/.rvm/bin:/Users/jlo/workspace/golang/bin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export GOPATH="/Users/jlo/gospace"
path+=("$GOPATH/bin")
export PATH

export JAVA_HOME=$(/usr/libexec/java_home)
export EC2_HOME=/usr/local/ec2/ec2-api-tools-1.7.5.0
export PATH=$PATH:$EC2_HOME/bin 
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export SL_USERNAME="maxim@us.ibm.com"
export SL_API_KEY="4afb3febf56ebbfb607468abbd862936e85aa9397458722dd3758c73c3598879"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias workspace="cd ~/workspace"
alias gospace="cd ~/gospace/src"
alias gopath="cd ~/gospace"
alias slcpi="cd ~/gospace/src/github.com/maximilien/bosh-softlayer-cpi"
alias slgo="cd ~/gospace/src/github.com/maximilien/softlayer-go"
alias slstemcell="cd ~/gospace/src/github.com/maximilien/bosh-softlayer-stemcells"


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# node
export NODE_PATH='/usr/local/lib/node_modules'

# git-duet configuration
export GIT_DUET_GLOBAL=true
export GIT_DUET_ROTATE_AUTHOR=1

export NVM_DIR="/Users/jlo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

### Added by the Bluemix CLI
source /usr/local/Bluemix/bx/zsh_autocomplete

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ajh17's ~/.zshrc

# Path {{{1
fpath=(~/.zsh/Completion ~/build/share/zsh/site-functions $fpath)
path=(~/build/bin /usr/local/sbin ~/.bin $path)
manpath=(~/build/share/man $manpath)

# Styles {{{1
# Cache completions
ZCACHEDIR=~/.cache/
zstyle ':completion:*' use-cache true
zstyle ':completion' cache-path $ZCACHEDIR
autoload -Uz compinit && compinit -i -C -d $ZCACHEDIR/zcompdump

# Completion options.
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose true
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' format '%F{yellow}Completing %d%f'
zstyle ':completion:*' warnings '%F{red}No matches for: %d%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' users ajh root
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors no=00 fi=00 di=01\;34 pi=33 so=01\;35 bd=00\;35 cd=00\;34 or=00\;41 mi=00\;45 ex=01\;32
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:manuals' separate-sections true
zstyle -e ':completion:*' hosts 'reply=()'
zstyle -e ':completion:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Aliases {{{1
alias grep="grep -EHIrn --color=auto --exclude-dir=backup --exclude-dir=*.{xcodeproj,git,svn,hg} --exclude={tags,Session.vim}"
alias ggrep="git grep --break --heading --line-number"
alias head='head -n $(( $LINES - 10 ))'
alias pgrep="pgrep -l"
alias gs="git status -sb"
alias cp="cp -vip"
alias rcp="rsync -av --info=progress2"
alias ls="ls -GApL"
alias mv="mv -vi"
alias rm="rm -v"

# Settings {{{1
setopt completeinword menucomplete chaselinks rmstarwait \
    cdablevars autopushd pushdsilent interactivecomments \
    promptsubst transientrprompt extendedglob globdots globstarshort \
    incappendhistory histignoredups histignorespace banghist
unsetopt flowcontrol clobber nomatch

# History {{{1
HISTFILE=$HOME/.cache/.zhistory
HISTSIZE=20000
SAVEHIST=20000

# Functions {{{1
# Go to the open Finder window's path
function cdf {
    target=$(osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)')
    if [[ "$target" != "" ]]; then
        cd "$target" || exit 1
    else
        echo -e 'There are no Finder windows!' >"$2"
    fi
}

# Redirect info to vim to use vim keybindings, rather than emacs
function info {
    command info "$@" | vim -u NONE -N -RM -
}

# Create a directory and cd into it
function mkcd {
    mkdir -p "$1" && cd "$1"
}

# Fetch the pull request on a local branch for easy diffing
function pull_github_request {
    if [[ -z "$1" ]]; then
        echo "You forgot to specify the Pull Request id number!"
    elif [[ -z "$2" ]]; then
        echo "You forgot to specify a local branch!"
    else
        git fetch origin pull/"$1"/head:"$2"
    fi
}

# Clear out completion caches and rebuild.
function remove_compl_cache() {
    rm -rf ~/.zcomp* ~/.cache/zcomp* && compinit
}

# Shows the most used shell commands.
function history_stat() {
    history 0 | awk '{print $2}' | sort | uniq -c | sort -n -r | head
}

# Key Remappings (Vi-mode) {{{1
bindkey -v
autoload -Uz edit-command-line
zle -N edit-command-line

bindkey -M vicmd "/" history-incremental-pattern-search-forward
bindkey -M vicmd "?" history-incremental-pattern-search-backward
bindkey -M vicmd '^g' what-cursor-position
bindkey -M vicmd '^r' redo
bindkey -M vicmd 'G' end-of-buffer-or-history
bindkey -M vicmd 'gg' beginning-of-buffer-or-history
bindkey -M vicmd 'u' undo
bindkey -M vicmd '~' vi-swap-case
bindkey -M vicmd '^v' edit-command-line
bindkey '^?' backward-delete-char
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[[Z' reverse-menu-complete
bindkey '^a' vi-insert-bol
bindkey '^_' run-help
bindkey '^e' vi-add-eol
bindkey '^k' kill-line
bindkey '^l' clear-screen
bindkey '^n' insert-last-word
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
bindkey '^u' vi-change-whole-line

# Prompt {{{1
function zle-line-init zle-keymap-select {
    prompt_char="${${KEYMAP/vicmd/%%}/(main|viins)/$}"
    zle reset-prompt
}

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zle -N zle-line-init
zle -N zle-keymap-select
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git hg
zstyle ':vcs_info:*' formats '%F{yellow}%b%f%u'
zstyle ':vcs_info:*' actionformats '%F{yellow}%b%f|%F{red}%a%f%u'
zstyle ':vcs_info:git+set-message:*' hooks git-untracked
function +vi-git-untracked() {
    [[ -n $(git ls-files --exclude-standard --others 2>/dev/null) ]] && \
        hook_com[unstaged]+="%F{red}?%f"
}

PROMPT=$'%(0?,,%F{red}%? )%(#.%F{1}.%f)%n%f@%m %F{green}%~%f %(#.#.$prompt_char) '
RPROMPT=$'$vcs_info_msg_0_'

