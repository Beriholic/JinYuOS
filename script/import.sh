pacman --needed -S - <../package/packages-repository.txt
cat ../package/packages-AUR.txt | xargs yay -S --needed --noconfirm
