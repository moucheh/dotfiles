# moucheh Dotfiles

- WM - [sway](https://github.com/moucheh/dotfiles/blob/master/sway/config)
- Bar - [waybar](https://github.com/moucheh/dotfiles/tree/master/waybar)
- Lock manager - [swaylock-effects](https://github.com/jirutka/swaylock-effects)
- Launcher - [fuzzel](https://github.com/moucheh/dotfiles/blob/master/fuzzel/fuzzel.ini)
- Terminal - [foot](https://github.com/moucheh/dotfiles/blob/master/foot/foot.ini)
- Editor - [nvim](https://github.com/moucheh/dotfiles/tree/master/nvim)
- [Fastfetch](https://github.com/moucheh/dotfiles/blob/master/fastfetch/config.jsonc)
- [Autotiling](https://pypi.org/project/autotiling/)

Make sure to clone the repository in your home directory
    
    git clone https://github.com/moucheh/dotfiles.git $HOME/.dotfiles
    
And then run the install script, you may need to add executable permissions

    chmod +x install.sh
    ./install.sh

If you already have a config for something that is included in these dotfiles, that config will be copied to a backup folder of current date and time, it will start with a dot so, it won't be lost.

For auto tiling to work, you need to install a python package

    pip install autotiling

You may need to make it executable

    chmod +x $(which autotiling)

To enable sddm theme, you need to copy the 03-sway-fedora contents to /usr/share/sddm/themes,
as well as set it inside /etc/sddm.conf file

    sudo cp -r 03-sway-fedora /usr/share/sddm/themes/
    sudo nvim /etc/sddm.conf

Make sure you have these lines in your config file

```
[Theme]
Current=03-sway-fedora
```

If you'd like to have fingerprint unlocking as well as password unlocking
copy pam.d/swaylock contents to /etc/pam.d/swaylock

    sudo cp pam.d/swaylock /etc/pam.d

You may need to delete the file if it already exists

    sudo rm pam.d/swaylock

This enables password entry as well as fingerprint scanner login.

## Sample images

### Screenshot 1 (main)
![Image 1](images/pic1.png)

### Screenshot 2 (nvim)
![Image 2](images/pic2.png)

### Screenshot 3 (fastfetch + cmatrix + cava)
![Image 3](images/pic3.png)

### Screenshot 4 (lazygit)
![Image 4](images/pic4.png)

### Screenshot 5 (ls replacement -> eza)
![Image 5](images/pic5.png)

### Screenshot 6 (sddm greeter)
![Image 6](images/pic6.png)
