-- Execute your favorite apps at launch
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --all")
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets,ssh --daemonize")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("rclone mount GoogleDrive: /home/tobi/Documents/GoogleDrive --vfs-cache-mode full --dir-cache-time 1000h --poll-interval 1m --attr-timeout 1000h --vfs-read-chunk-size 32M --vfs-read-chunk-size-limit 1G --vfs-cache-max-size 10G --vfs-cache-max-age 168h --daemon")
    hl.exec_cmd("kbuildsycoca6")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("waybar")
    hl.exec_cmd("slack")
    hl.exec_cmd("thunderbird")
end)
