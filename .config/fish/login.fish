function set_wayland_env
    # 设置语言环境为中文
    set -gx LANG zh_CN.UTF-8
    # 解决QT程序缩放问题
    set -gx QT_AUTO_SCREEN_SCALE_FACTOR 1.5
    # QT使用wayland和gtk
    set -gx QT_WAYLAND_DISABLE_WINDOWDECORATION 1
    # 使用qt5ct软件配置QT程序外观
    set -gx QT_QPA_PLATFORMTHEME qt5ct
    # 一些游戏使用wayland
    set -gx SDL_VIDEODRIVER wayland
    # 解决java程序启动黑屏错误
    set -gx _JAVA_AWT_WM_NONEREPARENTING 1
    # GTK后端为 wayland和x11,优先wayland
    set -gx GDK_BACKEND "wayland,x11"
    # Session
    set -gx XDG_SESSION_TYPE wayland
    set -gx XDG_SESSION_DESKTOP sway
    set -gx XDG_CURRENT_DESKTOP sway
    # Wayland stuff
    set -gx MOZ_ENABLE_WAYLAND 1
    set -gx SDL_VIDEODRIVER wayland
    #set -gx _JAVA_AWT_WM_NONREPARENTING 1
end
# 命令行输入这个命令启动 Hyprland，可以自定义
function stt
    set_wayland_env
    #exec xrandr --output eDP-1 --scale 1.5x1.5
    # 启动 Hyprland 程序
    exec Hyprland
end
# 如果当前终端是 /dev/tty1，则执行 stt 函数
if test (tty) = "/dev/tty1"
    stt
end
# Added by Toolbox App
set -gx PATH $PATH /home/beri/.local/share/JetBrains/Toolbox/scripts
