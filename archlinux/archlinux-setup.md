# **Installing Arch Linux**

* Edit /etc/pacman.conf configure pacman
  * uncomment Color
  * uncomment ILoveCandy
  * add parallel downloads
  * update mirrors.

* Install AUR helper (paru)
  ```sh
  sudo pacman -S --needed base-devel
  git clone https://aur.archlinux.org/paru.git
  cd paru
  makepkg -si
  ```

* git clone dotfiles and symlink them.
  ```sh
  git clone https://www.github.com/upalbarua/melinda-dotfiles.git
  mv melinda-dotfiles dotfiles
  cd dotfiles
  ./hookup-dots.sh
  ```

* Install all the necessary packages from pkglist.txt
  ```sh
  paru -S --needed - < pkglist.txt
  ```

* Update z4h and change default shell to zsh.
  ```sh
  z4h update
  chsh -s $(which zsh)
  sudo chsh -s $(which zsh)
  ```

* Adjust necessary browser settings and sync then login into
  * Google
  * Bitwarden

* Setup automatic disk mounting with gnome-disk-utility and fstab.

* Setup a 2gb swap file.
  ```sh
  sudo dd if=/dev/zero of=/swapfile bs=1M count=2048
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile
  swapon --show

  sudo nvim /etc/fstab
   + /swapfile none swap defaults 0 0
  ```

* setup vs code and install all the necessary extensions.

* Rice the setup
  * Alacritty
  * Polybar
  * Rofi
  * Dunst
  * Xresources
  * Neovim
  * VS Code
  * Cursors
  * Gtk
  * Kvantum
  * qt5ct
  * tty
  * Browser
  * Dark reader
  * Vimium
  * bat
  * btop
  * fzf
  * zsh-syntax
  * Grub
  

* Install and enable auto-cpufreq for battery optimization
  ```sh
  sudo systemctl mask power-profiles-daemon.service
  sudo systemctl enable --now auto-cpufreq.service
  ```

* Place and enable the screenlock service
  ```sh
  sudo cp ~/dotfiles/screenlock.service /usr/lib/systemd/system/
  sudo systemctl enable screenlock.service
  ```

* Setup firewall
  ```sh
  sudo pacman -S ufw
  sudo ufw enable
  sudo ufw status verbose
  sudo systemctl enable ufw.service
  ```

* setup paccache.timer
  ```sh
  sudo pacman -S pacman-contrib
  sudo systemctl enable paccache.timer
  ```

* setup fstrim.timer
  ```sh
  sudo systemctl enable fstrim.timer
  sudo systemctl start fstrim.timer
  ```

* Install microcode
  ```sh
  sudo pacman -S intel-ucode
  sudo grub-mkconfig -o /boot/grub/grub.cfg
  ```

* Install then uninstall VLC for the codecs

* Setup timeshift auto backups
  ```sh
  sudo systemctl start cronie.service
  ```
