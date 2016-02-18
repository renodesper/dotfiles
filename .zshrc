### Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi

### Keybinding
unsetopt MULTIBYTE
autoload zkbd

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Insert]} ]] && bindkey "${key[Insert]}" overwrite-mode
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

### Export
export EDITOR='vim'
export VISUAL='vim'
export NOTI_DEFAULT="banner pushbullet"
export NOTI_PUSHBULLET_TOK='o.dIMrgTs1laI8zy4Xindmx8wajSagNCCE'
export VBOX_USB='usbfs'

export GOPATH=$HOME/App/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/App/bin
export PATH=$PATH:/usr/lib/eclipse/plugins/org.eclim_2.5.0/bin

### fzf Setting
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=$PATH:$HOME/.fzf/bin
export FZF_COMPLETION_TRIGGER='~~'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

### pyenv Setting
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### rbenv Setting
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

### Alias
alias amc="go-mtpfs ~/Android"
alias amd="fusermount -u ~/Android"
alias auto_ssh="autossh -M 0 -o 'ServerAliveInterval 45' -o 'ServerAliveCountMax 2'"
alias balsamiq="adobe-air ~/Binary/balsamiq.air"
alias gundo='git reset HEAD~ && git clean -df'
alias msfconsole="msfconsole --quiet -x "db_connect postgres@msfdb""
alias redwm='cd ~/Project/abs/dwm_collections/dwm; updpkgsums; makepkg -efi --noconfirm; killall dwm'
alias resizer='java -jar ~/Binary/Resizer_1.3.3.jar'
alias sqlplus='rlwrap sqlplus'
alias tchrome='torsocks google-chrome-stable'
alias tluakit='torsocks luakit'
alias tmux='tmux -2'
alias tmuxp2='tmuxp load -2 main.yaml'
alias ttytter='ttytter -ssl -dostream -readline -ansi -newline -exts=$HOME/.ttytter/oxhak_ttytter_output.pl'
alias vi='vim'
alias webget='wget -m -p -E -k -K -np'
alias webserver-start="sudo systemctl start httpd && sudo systemctl start mysqld"
alias webserver-stop="sudo systemctl stop httpd && sudo systemctl stop mysqld"
alias xev2="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode ([0-9]*).* (.*, (.*)).*$/ /p'"
alias xprop2='xprop | grep WM_CLASS'

alias create_virt_ap="sudo iw dev wlp4s0 interface add ap0 type __ap"
alias wifi_single="sudo create_ap --no-virt ap0 wlp4s0 'awk & sed' 'ColemakToRuleThemAll'"
alias wifi_eth="sudo create_ap wlp4s0 enp3s0 'awk & sed' 'ColemakToRuleThemAll'"
alias wifi_ppp="sudo create_ap wlp4s0 ppp0 'awk & sed' 'ColemakToRuleThemAll'"

alias ebtek_tunnel="autossh -M 0 -o 'ServerAliveInterval 45' -o 'ServerAliveCountMax 2' -D 1080 ebtek@103.225.66.131 -p 7122"
alias ebtek_tunnel2="autossh -M 0 -o 'ServerAliveInterval 45' -o 'ServerAliveCountMax 2' ebtek@103.225.66.131 -p 7122"
alias cloud_tunnel="autossh -M 0 -o 'ServerAliveInterval 45' -o 'ServerAliveCountMax 2' -D 1081 root@103.18.244.158 -p 3022"
alias cloud_tunnel2="autossh -M 0 -o 'ServerAliveInterval 45' -o 'ServerAliveCountMax 2' root@103.18.244.158 -p 3022"

### Function
source ~/.scripts/functions.sh
