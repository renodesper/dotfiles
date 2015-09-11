### Export
# export TERM=xterm-256color
export VBOX_USB='usbfs'
export EDITOR='vim'
export VISUAL='vim'
export GOPATH=$HOME/Project/Go
export PATH=$PATH:$GOPATH/bin

### pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

### Alias
alias recompile_dwm='cd ~/Project/dwm; updpkgsums; makepkg -efi --noconfirm; killall dwm'
alias amc="go-mtpfs ~/Android"
alias amd="fusermount -u ~/Android"
alias balsamiq="adobe-air ~/Binary/balsamiq.air"
alias gundo='git reset HEAD~ && git clean -df'
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
alias wireshare="sudo create_ap wlp4s0 enp3s0 'SSID' password"
alias xev2="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xprop2='xprop | grep WM_CLASS'

### Laravel Generator Stuff
# alias artisan="php artisan"
# alias g:c="php artisan generate:controller"
# alias g:m="php artisan generate:model"
# alias g:mig="php artisan generate:migration"
# alias g:r="php artisan generate:resource"
# alias g:s="php artisan generate:seed"
# alias g:v="php artisan generate:view"

### Keybinding
unsetopt MULTIBYTE
autoload zkbd
source $HOME/.zkbd/terminator-:0

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

### Function

