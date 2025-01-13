function fish_greeting
  echo (set_color yellow; date '+%A, %d %B %Y'; set_color normal)
  echo -s 'Currently logged in as ' (set_color green; whoami; set_color normal) ' at ' (set_color green) $hostname (set_color normal)
  echo
end
