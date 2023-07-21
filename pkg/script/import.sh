pacman --needed -S - <../packages-repository.txt
cat ../packages-AUR.txt | xargs yay -S --needed --noconfirm
