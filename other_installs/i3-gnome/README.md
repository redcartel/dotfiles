ok so this got kind of fucked

install gnome-flashback, gnome-session-flashback

replace the session file in /usr/share/gnome-session/sessions

These lines need to be in i3 config:

exec --no-startup-id gnome-session --systemd --session=gnome-flashback-metacity --disable-acceleration-check "$@"
exec --no-startup-id gnome-flashback
exec --no-startup-id /usr/lib/gnome-settings-daemon/gsd-xsettings
