export VISUAL=nvim;
export EDITOR=nvim;
xrandr --output DP-1-1 --mode 1920x1080 --rate 144 2>/dev/null
alias backupDevice="~/Installation_Script/scripts/backup.sh"
alias xr144="xrandr --output DP-1-1 --mode 1920x1080 --rate 144"
alias xr144="xrandr --output DP-1 --mode 1920x1080 --rate 144"
alias ..="cd .."

function set_win_title() {
    local cmd=" ($@)"
    if [[ "$cmd" == " (starship_precmd)" || "$cmd" == " ()" ]]
    then
        cmd=""
    fis
    if [[ $PWD == $HOME ]]
    then
        if [[ $SSH_TTY ]]
        then
        echo -ne "\033]0;@ $HOSTNAME ~$cmd\a" < /dev/null
        else
        echo -ne "\033]0;~$cmd\a" < /dev/null
        fi
    else
        BASEPWD=$(basename "$PWD")
        if [[ $SSH_TTY ]]
        then
        echo -ne "\033]0;$BASEPWD @ $HOSTNAME $cmd\a" < /dev/null
        else
        echo -ne "\033]0;$BASEPWD $cmd\a" < /dev/null
        fi
    fi

}
starship_precmd_user_func="set_win_title"
eval "$(starship init bash)"
trap "$(trap -p DEBUG |  awk -F"'" '{print $2}');set_win_title \${BASH_COMMAND}" DEBUG
