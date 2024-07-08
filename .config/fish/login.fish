function stt
    set -gx LANG zh_CN.UTF-8
    exec Hyprland
end

if test (tty) = "/dev/tty1"
   stt
end

