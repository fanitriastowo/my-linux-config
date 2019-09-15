# Setup fzf
# ---------
if [[ ! "$PATH" == */home/triastowo/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/triastowo/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/triastowo/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/triastowo/.fzf/shell/key-bindings.bash"
