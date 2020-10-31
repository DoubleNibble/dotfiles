alias mt-desktop1="startx ~/.xinitrc"
alias mt-desktop2="startx ~/.xinitrc secondary"

alias audio-restart="pulseaudio -k; pulseaudio --start"
alias wifi-connect="nmcli d wifi"

alias keymon-start="key-mon --key-timeout=1.5 --no-press-fadeout=2 --old-keys=5"

alias mt-power-prevent-sleep="systemctl mask sleep.target suspend.target"
alias mt-power-allow-sleep="systemctl unmask sleep.target suspend.target"
alias mt-power-shutdown="systemctl poweroff"
alias mt-power-reboot="systemctl reboot"
alias mt-power-suspend="systemctl suspend"
alias mt-power-hibernate="systemctl hibernate"