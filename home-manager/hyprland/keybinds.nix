{
  settings = {
    bind = [
      "SUPER,1,workspace,1"
      "SUPER,2,workspace,2"
      "SUPER,3,workspace,3"
      "SUPER,4,workspace,4"
      "SUPER,5,workspace,5"
      "SUPER,6,workspace,6"
      "SUPER,7,workspace,7"
      "SUPER,8,workspace,8"
      "SUPER,9,workspace,9"
      "SUPER,0,workspace,10"
      "SUPER,F,fullscreen,1"
      "SUPERSHIFT,F,fullscreen,0"
      "SUPER,C,killactive,"
      "SUPER, T, togglefloating,"
      # Screenshot
      "SUPERSHIFT,S,exec,hyprshot -m region -o $HOME/Pictures/screenshot"
      "SUPER+CTRL,S,exec,hyprshot -m window -o $HOME/Pictures/screenshot"
      # Apps
      "ALT,space,exec,fuzzel"
      "SUPER,RETURN,exec,kitty"
      "SUPER,E,exec,nautilus"
      # Action
      "SUPER,Escape, exec, wlogout"
      "Control+Super, T, exec, ~/.config/matugen/gencolor.sh"
      "ALT+Super, T, exec, ~/.config/matugen/gencolor.sh --random"
    ];
    bindm = [
      "SUPER,mouse:272,movewindow"
      "SUPER,mouse:273,resizewindow"
    ];
    bindle = [
      ", XF86MonBrightnessUp, exec, qs ipc call brightness increment"
      ", XF86MonBrightnessDown, exec, qs ipc call brightness decrement"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
    ];
    bindl = [
      "ALT,m, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"
      ",XF86AudioMute, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%"
    ];
  };
}
