# Zap/ install at https://github.com/zap-zsh/zap
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/go/bin:$PATH"
export EDITOR=nvim

ZSH_THEME="robbyrussell"

# Plugins plugins=(git)
source $ZSH/oh-my-zsh.sh

# Starship prompt
eval "$(starship init zsh)"

# Zap 
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "agkozak/zsh-z"
plug "esc/conda-zsh-completion"

# Alias 
# Replacement Icons for ls 
alias l="exa -a  --icons -l"
alias ll="exa -l --icons"
alias lll="exa -Ga --icons"


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#free
alias free="free -mt"

#continue download
alias wget="wget -c"


# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias yay='yay --color auto'
alias paru='paru --color auto'

yayskip()
{
    yay -S $1 --mflags "--skipchecksums --skippgpcheck"
}

paruskip()
{
    paru -S $1 --mflags "--skipchecksums --skippgpcheck"
}

#ps
#alias psa="ps auxf"
#alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#Cleanup orphaned packages
alias autoremove='sudo pacman -Rns $(pacman -Qtdq) && sudo paccache -r'

#clear
alias clean="clear; seq 1 $(tput cols) | sort -R | sparklines | lolcat"

alias ex='~/.script/ex.sh'

alias acinit='~/.script/acinit.sh'

# Apps alias
alias neofetch='neofetch --source ~/.config/neofetch/ascii.txt'


alias cd..="cd .."
#ascii art
alias ascfish="asciiquarium"
alias mycat='oneko'
alias fire='aafire -driver curses -boldfont'

#v2raya
alias stv2="bash $HOME/.script/v2/st.sh"
alias spv2="bash $HOME/.script/v2/sp.sh"

# Neofetch 
#neofetch

# neovide
alias xw='env -u WAYLAND_DISPLAY'

#cd acm
alias toac='cd ~/Berijects/C++/acm'

#docker
alias stdc="sudo systemctl start docker"
alias spdc="sudo systemctl stop docker.service docker.socket"


#nvm
source ~/.nvm/nvm.sh

#bat->cat
alias cat='bat'
alias ccat='cat'

#open zhsrc
alias nz="$EDITOR ~/.zshrc"
#source zhsrc
alias snz='source ~/.zshrc'

#Duf
alias disk='duf'

#nmcli
alias wifils='nmcli device wifi'

#rainbowcat
alias rainbowcat='nyancat'

#btop
alias btp='btop'
#gtp
alias gtp='gotop'
#timeshift
alias timeshift-gui='sudo -E timeshift-gtk'
#change theme
alias theme-blue='cd ~/.config/hypr && git checkout blue && cd ~/.config/waybar && git checkout blue && cd'
alias theme-pink='cd ~/.config/hypr && git checkout pink && cd ~/.config/waybar && git checkout pink && cd'

alias st_waydroid='sudo systemctl start waydroid-container'   
alias sp_waydroid='sudo systemctl stop waydroid-container'   

alias fdd='fzf'

alias moto="cat ~/Berijects/moto"

alias dc='cd'

alias stbox='~/.script/virsh/st.sh'
alias spbox='~/.script/virsh/sp.sh'

#sherlock find Hunt down social media accounts by username across social networks
alias fname='sherlock'

alias colorcat='lolcat'

alias atree='cbonsai'

alias codefetch='onefetch'

alias ktheme='kitten themes'

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

alias togo='cd $HOME/Berijects/go/'
alias tocpp='cd $HOME/Berijects/C++/'
alias torust='cd $HOME/Berijects/rust/'
alias nvid='neovide'

alias todo='dooit'

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /home/beri/minio-binaries/mc mc
