function theme 
    switch $argv[1]
    case light
         gsettings set org.gnome.desktop.interface  gtk-theme  adw-gtk3 
         gsettings set org.gnome.desktop.interface color-scheme prefer-light
         sed -i 's/dark/white/g' $HOME/.config/fcitx5/conf/classicui.conf
         fcitx5 --replace -d >/dev/null 2>&1 &
         echo 'done'
    case dark
         gsettings set org.gnome.desktop.interface  gtk-theme  adw-gtk3-dark
         gsettings set org.gnome.desktop.interface color-scheme prefer-dark
         sed -i 's/white/dark/g' $HOME/.config/fcitx5/conf/classicui.conf
         fcitx5 --replace -d >/dev/null 2>&1 &
         echo 'done'
    end
end
