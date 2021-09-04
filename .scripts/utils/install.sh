pacman -S linux linux-firmware base base-devel amd-ucode sudo
pacman -S reflector NetworkManager pacman-contrib nvidia picom alsa-utils pulseaudio
pacman -S grub efibootmgr dosfstools os-prober mtools
pacman -S make man-pages

git clone https://aur.archlinux.org/yay.git
# yay -S upd72020x-fw wd719x-firmware aic94xx-firmware


pacman -S xmobar xmonad xmonad-contrib


pacman -S alacritty calcurse git bat pfetch neovim htop ranger dmenu
pacman -S firefox qutebrowser libreoffice-still lxappearance gimp gnome-screenshot nitrogen nemo mpv discord conky
pacman -S ghc cabal-install hindent hoogle pandoc clisp
pacman -S neomutt isync m4 msmtp pass
pacman -S nodejs npm
pacman -S clang ctags
# pacman -S fzf ripgrep the_silver_searcher
pacman -S fd
pacman -S sxiv slock task python-pip
pacman -S zip unzip imagemagick wget
pacman -S xorg xorg-xinit xclip xf86-video-vesa xdg-utils
pacman -S zsh zsh-autosuggestions zsh-completions
pacman -S mupdf zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps


pacman -S cargo libgit2
cargo install exa ytop


pacman -S arc-gtk-theme arc-icon-theme

git clone https://github.com/jmattheis/gruvbox-dark-gtk
git clone https://github.com/jmattheis/gruvbox-dark-icons-gtk
