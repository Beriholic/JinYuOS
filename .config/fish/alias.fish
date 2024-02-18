alias l "exa -a  --icons -l"
alias ll "exa -l --icons"
alias lll "exa -Ga --icons"

alias df 'df -h'

alias free "free -mt"

alias wget "wget -c"


alias pacman 'sudo pacman --color auto'
alias yay 'yay --color auto'
alias paru 'paru --color auto'


function yayskip -d "skip checksums pgpcheck"
    yay -S $argv[1] --mflags "--skipchecksums --skippgpcheck"
end

function paruskip -d "skip checksums pgpcheck"
    paru -S $argv[1] --mflags "--skipchecksums --skippgpcheck"
end

#ps
#alias psa "ps auxf"
#alias psgrep "ps aux | grep -v grep | grep -i -e VSZ -e"

alias update-grub "sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias update-fc 'sudo fc-cache -fv'

alias autoremove 'sudo pacman -Rns $(pacman -Qtdq) && sudo paccache -r'

alias clean "clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

alias acinit 'cd $HOME && sh ~/.script/acinit.sh && toac'

alias neofetch 'neofetch --source ~/.config/neofetch/ascii.txt'

alias cd.. "cd .."

alias ascfish "asciiquarium"
alias mycat 'oneko'
alias fire 'aafire -driver curses -boldfont'

#v2raya
function stv2
    sudo systemctl start v2raya.service
end

function spv2
    sudo systemctl stop v2raya.service
end
# Neofetch 
#neofetch

# neovide
alias xw 'env -u WAYLAND_DISPLAY'

#cd acm
alias toac 'cd ~/Berijects/C++/acm'

#docker
alias stdc "sudo systemctl start docker"
alias spdc "sudo systemctl stop docker.service docker.socket"

alias cat 'bat'
alias ccat 'cat'

#Duf
alias disk 'duf'

#nmcli
alias wifils 'nmcli device wifi'

#rainbowcat
alias rainbowcat 'nyancat'

#btop
alias btp 'btop'
#gtp
alias gtp 'gotop'
#timeshift
alias timeshift-gui 'sudo -E timeshift-gtk'

alias fdd 'fzf'

alias dc 'cd'

function stbox
    sudo systemctl start libvirtd.service 
    sudo systemctl start libvirtd-ro.socket  
    sudo systemctl start libvirtd-admin.socket  
    sudo systemctl start libvirtd.socket
end
function spbox
    sudo systemctl stop libvirtd.service 
    sudo systemctl stop libvirtd-ro.socket  
    sudo systemctl stop libvirtd-admin.socket  
    sudo systemctl stop libvirtd.socket
end

alias fname 'sherlock'

alias colorcat 'lolcat'

alias atree 'cbonsai'

alias codefetch 'onefetch'

alias ktheme 'kitten themes'

alias nvid 'neovide'

alias todo 'dooit'
alias nemo 'nautilus'
