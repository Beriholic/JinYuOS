function theme 
    switch $argv[1]
    case light
         gsettings set org.gnome.desktop.interface  gtk-theme  adw-gtk3 
         gsettings set org.gnome.desktop.interface color-scheme prefer-light
         kvantummanager  --set WhiteSur
         sed -i 's/dark/white/g' $HOME/.config/fcitx5/conf/classicui.conf
         #fcitx5 --replace -d &>/dev/null
         echo 'done'
    case dark
         gsettings set org.gnome.desktop.interface  gtk-theme  adw-gtk3-dark
         gsettings set org.gnome.desktop.interface color-scheme prefer-dark
         kvantummanager  --set WhiteSurDark
         sed -i 's/white/dark/g' $HOME/.config/fcitx5/conf/classicui.conf
         #fcitx5 --replace -d &>/dev/null
         echo 'done'
    end
end
