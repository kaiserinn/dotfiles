starship init fish | source

set TREE_IGNORE "cache|log|logs|node_modules|vendor"
zoxide init fish | source

alias ls='exa --group-directories-first --icons'
alias la='exa -a --icons'
alias ll='exa --git -l --icons'
alias lt='exa --tree -D -L 2 -I $TREE_IGNORE --icons'
alias ltt='exa --tree -D -I $TREE_IGNORE --icons'
alias ltta='exa --tree -I $TREE_IGNORE --icons --group-directories-first'

alias cat="bat"

alias cd="z"
alias zz="z -"

function ya
  set tmp (mktemp -t "yazi-cwd.XXXXX")
  yazi $argv --cwd-file="$tmp"
  if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    builtin cd -- "$cwd"
  end
  rm -f -- "$tmp"
end
