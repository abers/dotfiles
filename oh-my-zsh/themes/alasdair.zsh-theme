
local user='%{$fg_bold[cyan]%}%n%{$fg_bold[green]%}@%{$fg[magenta]%}%m%{$reset_color%}'
local pwd='%{$fg[yellow]%}%~%{$reset_color%}'
local return_code='%(?..%{$fg[red]%}%? ↵%{$reset_color%})'
local git_branch='$(git_prompt_status)%{$reset_color%}$(git_prompt_info)%{$reset_color%}'
local newline=$'\n'
local endprompt='%($fg_bold[blue]%}$'

ZSH_THEME_RVM_PROMPT_OPTIONS="i v g"
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%} !!!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} +"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} *"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} -"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ="
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ++"

PROMPT="${user} ${pwd} ${git_branch} ${newline}%{$fg[blue]%}$ "
RPROMPT="${return_code}"
