# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# kubectl autocompletion add
autoload -Uz compinit
compinit

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# 2024.04.21 THEME change
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="agnoster"

# powerlevel10k prompt config
# prompt_context() {
#  # Custom (Random emoji)
#   emojis=("🐤" "🐥" "🐣" "🌈" "🍔" "🍣" "🍤" "🍙" "🍱")
#  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
#  prompt_segment black default "airlee ${emojis[$RAND_EMOJI_N]} "
#}

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
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# computer name delete
# prompt_context() {
#   if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#     prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
#   fi
# }

# command color config
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


###############
# airlee config
###############
# export PATH=/opt/homebrew/bin:$PATH
export PATH=$PATH:/opt/homebrew/bin

#!--------- Alias Config ---------!#
# kubectl alias config
# source <(kubectl completion bash)
alias k=kubectl
complete -F __start_kubectl k

### k8s autocompleetion config
# source <(/Users/jh.lee/Downloads/google-cloud-sdk/bin/kubectl completion zsh)  # set up autocomplete in zsh into the current shell
# echo '[[ $commands[kubectl] ]] && source <(kubectl completion zsh)' >> ~/.zshrc # add autocomplete permanently to your zsh shell
source <(kubectl completion zsh)  # set up autocomplete in zsh into the current shell
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

### kubecolor config add
alias kubectl=kubecolor
# make completion work with kubecolor
compdef kubecolor=kubectl

#####################
# kubeswitch config #
#####################
source <(switcher init zsh)
source <(alias s=switch)
source <(compdef _switcher switch)


#!--------- dataplatform connect Config ---------!#
alias maria='k exec -it -n dataplatform mariadb-sts-0 -- /bin/bash'
alias vault='k exec -it -n dataplatform vault-0 -- /bin/sh'

#!--------- VPN Zone Alias Config ---------!#
# alias bok='switch bok-zone3/kubernetes-admin@cluster.local'
# alias kcredit='switch kcredit-zone3/kubernetes-admin@cluster.local'


#!--------- zshrc scp config ----------!#
alias scp='noglob scp'

# apple logo add config
neofetch

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#!--------- neovim config ----------!#
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim

# The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/jh.lee/Desktop/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jh.lee/Desktop/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
# if [ -f '/Users/jh.lee/Desktop/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jh.lee/Desktop/google-cloud-sdk/completion.zsh.inc'; fi


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jh.lee/Google/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jh.lee/Google/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jh.lee/Google/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jh.lee/Google/google-cloud-sdk/completion.zsh.inc'; fi

### google cloud config
export GCLOUDPATH=/Users/jh.lee/Google/google-cloud-sdk
export PATH=$PATH:$GCLOUDPATH/bin
