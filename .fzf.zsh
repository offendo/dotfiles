# Setup fzf
# ---------
if [[ ! "$PATH" == */home/offendo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/offendo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/offendo/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/offendo/.fzf/shell/key-bindings.zsh"
