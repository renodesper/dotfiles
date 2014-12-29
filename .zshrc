# Export
VBOX_USB=usbfs

SSH_AUTH_SOCK=`ss -xl | grep -o '/run/user/1000/keyring-R6s36A/ssh$'`
[ -z "$SSH_AUTH_SOCK" ] || export SSH_AUTH_SOCK

#export TERM=xterm-256color
export EDITOR='vim'
export GOPATH=$HOME/Project/Go
export PATH=$PATH:$GOPATH/bin

# Alias
alias redwm='cd ~/dwm; updpkgsums; makepkg -efi --noconfirm; killall dwm'
alias amc="go-mtpfs ~/Android"
alias amd="fusermount -u ~/Android"
alias balsamiq="adobe-air ~/Binary/balsamiq.air"

alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

alias gundo='git reset HEAD~ && git clean -df'
alias mm="cd ~/Project/MM/"
alias resizer='java -jar ~/Binary/Resizer_1.3.3.jar'
alias ssh='eval $(/usr/bin/keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa) && ssh'
alias sqlplus='rlwrap sqlplus'
alias tmux='tmux -2'
alias ttytter='ttytter -ssl -dostream -readline -ansi -newline -exts=/home/username/.ttytter/oxhak_ttytter_output.pl'
alias vi='vim'
alias webget='wget -m -p -E -k -K -np'
alias webserver="sudo systemctl start httpd && sudo systemctl start mysqld"
alias wireshare="sudo create_ap wlp3s0 ppp0 'boodoe.net' VimToRuleThemAll"
alias xev2="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'

# Tor Alias
alias tchrome='torsocks google-chrome-stable'
alias tluakit='torsocks luakit'

# Laravel Generator Stuff
alias artisan="php artisan"
alias g:m="php artisan generate:model"
alias g:c="php artisan generate:controller"
alias g:v="php artisan generate:view"
alias g:s="php artisan generate:seed"
alias g:mig="php artisan generate:migration"
alias g:r="php artisan generate:resource"

# Virtual Environment for Python and Python2
p2() {
  source ~/.venv2/bin/activate && alias livereload="cd ~/public_html && livereload"
}
p3() {
  source ~/.venv/bin/activate && alias livereload="cd ~/public_html && livereload"
}

# RVM PATH and completion
[[ -r "$HOME/.rvm/scripts/completion" ]] && source "$HOME/.rvm/scripts/completion"
PATH=$PATH:$HOME/Binary
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Keybinding
unsetopt MULTIBYTE
autoload zkbd
source /home/username/.zkbd/terminator-:0

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
