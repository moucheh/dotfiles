# moucheh Dotfiles

- WM - [niri](https://github.com/moucheh/dotfiles/tree/master/config/niri)
- Bar - [waybar](https://github.com/moucheh/dotfiles/tree/master/config/waybar)
- Login manager - gdm
- Lock manager - [gtklock](https://github.com/moucheh/dotfiles/tree/master/config/gtklock/config.ini)
- Launcher - [fuzzel](https://github.com/moucheh/dotfiles/blob/master/config/fuzzel/fuzzel.ini)
- Terminal - [foot](https://github.com/moucheh/dotfiles/blob/master/config/foot/foot.ini)
- Editor - [nvim](https://github.com/moucheh/dotfiles/tree/master/config/nvim)
- mvim - [fully native nvim setup no external plugins](https://github.com/moucheh/dotfiles/tree/master/config/mvim)
- niri dock - [lavalauncher](https://git.sr.ht/~leon_plickat/lavalauncher)
- Notification center - [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)
- OSD - [SwayOSD](https://github.com/ErikReider/SwayOSD)
- Drawer - [nwggrid](https://github.com/moucheh/dotfiles/blob/master/config/nwg-launchers/nwggrid/style.css)
- Starship - [starship](https://github.com/moucheh/dotfiles/blob/master/config/starship.toml)
- [Fastfetch](https://github.com/moucheh/dotfiles/blob/master/config/fastfetch/config.jsonc)

Make sure to clone the repository in your home directory
    
    git clone https://github.com/moucheh/dotfiles.git $HOME/.dotfiles
    
And then run the install script, you may need to add executable permissions

    chmod +x install.sh
    ./install.sh

If you already have a config for something that is included in these dotfiles, that config will be copied to a backup folder of current date and time, it will start with a dot so it will be hiden, but won't be lost.


I've also added a script that does ascii art generation for nvim dashboard.
Figlet is a dependency, you can install it through your distro's package manager.

    sudo dnf install figlet
    ~/.dotfiles/scripts/nvdash_art.sh moucheh

If you would like to try out the fully native nvim setup (mvim - it has no external plugins), you can run it with the follwoing command

    nvim -u ~/.dotfiles/config/mvim/init.lua

## Sample images

### Screenshot 1 (main)
![Image 1](images/pic1.webp)

### Screenshot 2 (nvim)
![Image 2](images/pic2.webp)

### Screenshot 3 (nvim lazy pkg manager)
![Image 3](images/pic3.webp)

### Screenshot 4 (Overview 1)
![Image 4](images/pic4.webp)

### Screenshot 5 (Overview 2)
![Image 5](images/pic5.webp)

### Screenshot 6
Clipboard management using wl-clipboard + clipman + fzf

Default keybinds:
- Super+C        - pick an entry
- Super+Shift+C  - clear an entry
- Super+Alt+C    - clear all entries

![Image 6](images/pic6.webp)

### Screenshot 7 (eza)
![Image 7](images/pic7.webp)

### Screenshot 8 (lazygit)
![Image 8](images/pic8.webp)

### Screenshot 9 (yazi)
![Image 9](images/pic9.webp)

### Screenshot 10 (fuzzel)
![Image 10](images/pic10.webp)

### Screenshot 11 (nwg-drawer)
![Image 11](images/pic11.webp)

### Screenshot 12 (lavalauncher)
![Image 12](images/pic12.webp)

### Screenshot 13 (swaync)
![Image 13](images/pic13.webp)

### Screenshot 14 (swayosd)
![Image 14](images/pic14.webp)

### Screenshot 15 (wlogout)
![Image 15](images/pic15.webp)

### Screenshot 16 (swaylock)
![Image 16](images/pic16.webp)

### Full quality wallpaper
![Background](images/waves.jpg)

