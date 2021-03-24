#  +--------------------------------------------------+
#  |                  DEFAULT STUFF                   |
#  +--------------------------------------------------+

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# vi mode
bindkey -v
# Path to your oh-my-zsh installation.
export ZSH="/home/offendo/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(vi-mode git tmux)

source $ZSH/oh-my-zsh.sh


#  +--------------------------------------------------+
#  |                       PATH                       |
#  +--------------------------------------------------+
export PATH=$PATH:~/.local/bin:~/.cargo/bin/
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH=$PATH:~/.pyenv/shims/
export PATH=$PATH:/home/offendo/.gem/ruby/2.7.0/bin
export PATH="$PYENV_ROOT/bin:$PATH"
# export TEXMFLOCAL=$TEXMFLOCAL:/usr/share/texmf-dist/


#  +--------------------------------------------------+
#  |                      ALIAS                       |
#  +--------------------------------------------------+
#alias python='python3.8'
#alias pip='python3 -m pip'
alias python2='/usr/bin/python2.7'
alias pip2='/usr/bin/python2.7 -m pip'
alias gst='git status'
alias truth="cowsay 'kathy is the cutest'"
alias l="exa -alh"
alias top="gotop -a -f"
alias oldtop="/usr/bin/top"
alias e="emacsclient -t"


#  +--------------------------------------------------+
#  |                    OTHER VARS                    |
#  +--------------------------------------------------+
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export EDITOR='nvim'
export VISUAL='nvim'
export PYENV_ROOT="$HOME/.pyenv"
export BAT_THEME='Dracula'
export GITPAGER='bat'
export MANPAGER='bat'

#  +--------------------------------------------------+
#  |                 RANDOM SETTINGS                  |
#  +--------------------------------------------------+

# turn off the system bell
xset -b

#  +--------------------------------------------------+
#  |                    FUNCTIONS                     |
#  +--------------------------------------------------+

# cd on exit in vim fff

# Example setup (posix) (non-bash)
f() { fff "$@"; cd "$(cat ~/.fff_d)"; }

# Customization (temporary file to use) (optional)
export FFF_CD_FILE=~/.fff_d

lnk() { 
    src=''
    dest=''
    while getopts 's:d:' opt; do
        case "${opt}" in
            s)  src="${OPTARG}";;
            d)  dest="${OPTARG}";;
        esac
    done
    ln -s $src $dest
}

autoload -U compinit && compinit
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#  +--------------------------------------------------+
#  |                       WTF                        |
#  +--------------------------------------------------+
#  {{{
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# }}}

#  +--------------------------------------------------+
#  |                   KEYBINDINGS                    |
#  +--------------------------------------------------+
autoload -Uz history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -M vicmd '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end
bindkey -M viins '^[[A' history-beginning-search-backward-end \
                 '^[OA' history-beginning-search-backward-end \
                 '^[[B' history-beginning-search-forward-end \
                 '^[OB' history-beginning-search-forward-end


#  +--------------------------------------------------+
#  |                    COMPLETION                    |
#  +--------------------------------------------------+

function _set-monitor(){
    _describe 'command' "('l: set the left monitor as primary' 'm: set the middle monitor as primary' 'r: set the right monitor as primary')"
}
compdef _set-monitor set-monitor

vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}
function stopwatch(){
    date1=`date +%s`; while true; do 
       echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    done
}
