function source_if_exist() {
  local file=$1
  [ -f $file ] && source $file
}

source_if_exist ~/.bashrc

# 環境依存の設定を読み込む
source_if_exist ~/.bash_local

### Gitの補完・プロンプト設定
source_if_exist /usr/local/etc/bash_completion.d/git-completion.bash
source_if_exist /usr/local/etc/bash_completion.d/git-prompt.sh

### Homebewの補完
source_if_exist /usr/local/etc/bash_completion.d/brew

### Dockerの補完
source_if_exist /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion
source_if_exist /Applications/Docker.app/Contents/Resources/etc/docker-machine.bash-completion
source_if_exist /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion

### rbenvの初期設定
if command -v rbenv >/dev/null; then
  eval "$(rbenv init -)"
  export PATH=$HOME/.rbenv/bin:$PATH
fi

### Colors
# https://github.com/sindresorhus/pure/wiki
# https://github.com/sapegin/dotfiles/blob/bash/includes/bash_prompt.bash
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
MAGENTA="$(tput setaf 5)"
CYAN="$(tput setaf 6)"
WHITE="$(tput setaf 7)"
GRAY="$(tput setaf 8)"
BOLD="$(tput bold)"
UNDERLINE="$(tput sgr 0 1)"
INVERT="$(tput sgr 1 0)"
NOCOLOR="$(tput sgr0)"

### プロンプトの表示変更
function prompt_command() {
  local prompt_symbol="❯"
  local first_line="\[$WHITE\]\u\[$NOCOLOR\] \[$YELLOW\]\w\[$NOCOLOR\]"
  local time_line=" \[$BLUE\]\t\[$NOCOLOR\]"
  local second_line="\`if [ \$? = 0 ]; then echo \[\$CYAN\]; else echo \[\$RED\]; fi\`$prompt_symbol\[$NOCOLOR\] "

  if command -v __git_ps1 >/dev/null; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWCOLORHINTS=1
    __git_ps1 "\n$first_line" "$time_line\n$second_line"
  else
    PS1="\n$first_line$time_line\n$second_line"
  fi

  PS2="\[$CYAN\]$prompt_symbol\[$NOCOLOR\] "
}
export PROMPT_COMMAND=prompt_command

### lsのエイリアス
alias ls="ls -GF"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"

### MacVimのエイリアスを設定
if [ -d /Applications/MacVim.app/ ]; then
  mac_vim_home="/Applications/MacVim.app/Contents/bin"
  alias gview="$mac_vim_home/gview"
  alias gvim="$mac_vim_home/gvim"
  alias gvimdiff="$mac_vim_home/gvimdiff"
  # alias mview="$mac_vim_home/mview"
  # alias mvim="$mac_vim_home/mvim"
  # alias mvimdiff="$mac_vim_home/mvimdiff"
  alias view="$mac_vim_home/view"
  alias vim="$mac_vim_home/vim"
  alias vimdiff="$mac_vim_home/vimdiff"
  alias vi="$mac_vim_home/vim"
fi

### Ctrl-s Ctrl-qの横取りを防ぐ
stty stop undef
stty start undef
