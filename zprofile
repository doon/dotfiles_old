if [[ -x /usr/bin/dircolors ]]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  export ZLSCOLORS="${LS_COLORS}"
fi
if [[ -s ~/.zprofile.local ]]; then source ~/.zprofile.local; fi
