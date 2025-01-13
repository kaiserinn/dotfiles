# default prompt
function fish_prompt
  set_color 606060; echo -n (whoami) '' 
  set_color 02D0A9; echo '❯' (prompt_pwd)  
  set_color normal; echo '❯ ';
end

# starship prompt
if type -q starship
  starship init fish | source
else
  fish_prompt
end
