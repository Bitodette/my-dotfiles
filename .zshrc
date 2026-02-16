export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

# TLP 
alias perf="sudo tlp ac"
alias save="sudo tlp bat"
alias mid="sudo tlp start"

# BATTERY
# full
alias bfull="sudo tlp setcharge 0 0 BAT0 && echo 'Charge to 100%.'"
# limit 60%
alias bsave="sudo tlp setcharge 1 1 BAT0 && echo 'Battery limit set to 60%.'"

# SYSTEM
alias up="sudo pacman -Syu"
alias pclean="sudo pacman -Sc"
alias premove="sudo pacman -Rns \$(pacman -Qtdq)"
alias fixboot="sudo mkinitcpio -P && sudo grub-mkconfig -o /boot/grub/grub.cfg"

# GPU LIMIT
alias gpusave="echo 450 | sudo tee /sys/class/drm/card1/gt_max_freq_mhz"
alias gpufull="echo 950 | sudo tee /sys/class/drm/card1/gt_max_freq_mhz"

# GIT
alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"

# NAV
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..="cd .. && ls"


export PATH="$HOME/.config/composer/vendor/bin:$PATH"
