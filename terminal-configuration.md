# CONFIGURATION OF GNOME TERMINAL 

## Configure Tmux Powerline VIM

- Install Python3 Pip
```bash
$ sudo apt-get install python3
$ sudo apt-get install python3-pip
```
- Install GIT
```bash
$ sudo apt-get install git
```

- Install Powerline
```bash
$ sudo pip3 install git+git://github.com/Lokaltog/powerline
```
Install powerline fonts
```bash
$ wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
$ wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
$ sudo mv PowerlineSymbols.otf /usr/share/fonts/
$ sudo fc-cache -vf /usr/share/fonts/
$ sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/
```
- Configure powerline for bash
Add following line in your ~/.bashrc (at the end of line) to make your terminal to support 256color :
```bash
$ cd 
$ nano .bashrc
```
```yaml
export TERM="screen-256color"
```
- Enable powerline on Bash Shell
```bash
$ sudo pip3 show powerline-status
```
Result :
```yaml
Name: powerline-status
Version: 2.8.1.dev9999-git.b-1869cc8bedbd6085959e8566cad6729f3e7e2620-
Summary: The ultimate statusline/prompt utility.
Home-page: https://github.com/powerline/powerline
Author: Kim Silkebaekken
Author-email: kim.silkebaekken+vim@gmail.com
License: MIT
Location: /usr/local/lib/python3.9/dist-packages
Requires: 
Required-by: 
```
Change dist-package path location to location path value at the above.\
In my case :
```yaml
Location: /usr/local/lib/python3.9/dist-packages
```
Add this line in your ~/.bashrc file:
```ỳaml
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.9/dist-packages/powerline/bindings/bash/powerline.sh
```
NOTE : This path must be change in your (case) real python dist-package path location : **/usr/local/lib/python3.9/dist-packages** \
Optional, check if path exist:
```bash
$ sudo ls /usr/local/lib/python3.9/dist-packages/powerline/bindings/bash/powerline.sh
```
**Reboot your terminal(type exit in your shell prompt)**

- Enable Powerline for VIM
Add this line in ~/.vimrc file:
```yaml
set  rtp+=/usr/local/lib/python3.9/dist-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
```
NOTE: This path must be change in your (case) real python dist-package path location : **/usr/local/lib/python3.9/dist-packages** \

### (OPTIONAL) If following message display when typing vim in your terminal prompt:
```bash
You need vim compiled with Python 2.6, 2.7 or 3.2 and later support
for Powerline to work. Please consult the documentation for more
details.
Appuyez sur ENTRÉE ou tapez une commande pour continuer
```
#### Follow these instructions:

```bash
$ sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev \
libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev \
python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git
```
- Remove vim if already exist:
```bash
$ # For Debian
  $ sudo apt remove vim vim-runtime gvim
$ # For Ubuntu : additionnal package to remove 
$ sudo apt remove vim-tiny vim-common vim-gui-common vim-nox
```
- Let's compile vim source:
```
$ cd 
$ git clone https://github.com/vim/vim.git
$ cd vim
$ ./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=$(python3-config --configdir) \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local
$ make VIMRUNTIMEDIR=/usr/local/share/vim/vim82 # vim82 if your vim verion is 8.2  change this in your case
```
If you want to be able to easily uninstall vim use **checkinstall**.
```bash
$ sudo apt install checkinstall
$ cd ~/vim
$ sudo checkinstall
```
Otherwise, you can use **make** to install.
```bash
$ cd ~/vim
$ sudo make install
```
- Set vim as your default editor with **update-alternatives** .
```bash
$ sudo update-alternatives --install /usr/bin/editor editor /usr/local/bin/vim 1
$ sudo update-alternatives --set editor /usr/local/bin/vim
$ sudo update-alternatives --install /usr/bin/vi vi /usr/local/bin/vim 1
$ sudo update-alternatives --set vi /usr/local/bin/vim
```
### Let come back to our tutorial

- Configure tmux
```bash
$ sudo apt-get update 
$ sudo apt-get install tmux
```
- Add these line in your **~/.tmux.conf** file
```yaml
# source "{repository_root}/powerline/bindings/tmux/powerline.conf"
source /usr/local/lib/python3.9/dist-packages/powerline/bindings/tmux/powerline.conf
set-option -g default-terminal screen-256color
```
