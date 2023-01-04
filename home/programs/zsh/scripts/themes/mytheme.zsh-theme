autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}+'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}!'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:svn:*' branchformat '%b'
zstyle ':vcs_info:svn:*' formats ' [%b%F{1}:%F{11}%i%c%u%B%F{green}]'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{gray}]'
  else
    zstyle ':vcs_info:git:*' formats ' [%b%c%u%B%F{red}*%F{gray}]'
  fi

  vcs_info
}

setopt prompt_subst
PROMPT='%{$fg_bold[gray]%}%~% %B%F{gray}${vcs_info_msg_0_}%B%F{blue} %{$reset_color%}% 
%{$FG[050]%}➞  %{$reset_color%}'

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd

