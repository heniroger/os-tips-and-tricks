# CONFIGURATION OF GNOME TERMINAL 

## Configure Tmux Powerline VIM
Full documentation https://powerline.readthedocs.io/en/master/index.html
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
- Install Powerline Prompt for Git
```
$ sudo pip3 install powerline-gitstatus
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

## Configure Oh-my-zsh

- Switch between shell:
```bash
$ exec bash # or exec zsh or exec fish
```
- Set a shell (bash , zsh, fish) as default
```bash
$ chsh -s $(which zsh) # For Zsh
$ chsh -s $(which bash) # For Bash
```
- Install oh-my-zsh 
```bash
$ # Via curl
$ sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
$ # Via wget
$ sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```
- Display default shell
```bash
$ getent passwd myusername
```
Result:
```yaml
myusername:x:1000:1000:MY_LOGIN_SCREEN_NAME:/home/myusername:/usr/bin/zsh
```
- Note : Exit zsh
```bash
$ logout 
```
- Install Zsh auto suggestion plugin at https://github.com/zsh-users/zsh-autosuggestions . Follow instructions in https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md

```bash
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
- Add the plugin to the list of plugins for Oh My Zsh to load (inside ~/.zshrc):
```yaml
plugins=(zsh-autosuggestions)
# If some configuration already exist, edit line like this
plugins=(git zsh-autosuggestions)
```
- Logout or close terminal or type :
```bash
$ source .zshrc
```
- TIPS : show command history:
```bash
$ history | less
```
- Show theme path
```bash
$ nano .zshrc # Theme example : ZSH_THEME="robbyrussell"
$ nano .oh-my-zsh/themes/robbyrussell.zsh-theme
```
- TIPS : Get shape for your prompt(to make pretty), go to https://unicode-table.com/fr/ and access to https://unicode-table.com/fr/#geometric-shapes .
Copy paste icon that you like, like in the following image :

![Change prompt icon](change_zsh_prompt.png)

- Install powerline on zsh
```bash
$ sudo apt install powerline -y
$ ls /usr/share/powerline/bindings/tmux/powerline.conf
```
- Add this line in your **~/.tmux.conf** file (if not exist)
```yaml
source /usr/share/powerline/bindings/tmux/powerline.conf
```
- Install Powerline fonts
```bash
$ sudo apt-get install fonts-powerline
```
- Set your theme to **agnoster** , change this line in your **~/.zshrc** file
```yaml
ZSH_THEME="agnoster"
```
- Add this line in your **~/.zshrc** file
```yaml
export TERM='xterm-256color'
. /usr/local/lib/python3.9/dist-packages/powerline/bindings/zsh/powerline.zsh
```
## Configure powerline for Visual Studio code
- Download  fonts at https://github.com/abertsch/Menlo-for-Powerline and copy fonts at **~/.fonts**  and update fonts cache:
```bash
$ cd /path/to/Menlo-for-Powerline  
$ cp *.ttf  ~/.fonts
$ fc-cache -vf ~/.fonts
```
- In your User Settings (Code | Preferences | Settings) or CTRL+SHIFT+P and type **settings.json** add this:
```json
{
  "terminal.integrated.fontFamily": "Menlo for Powerline",
}
```
## When powerline crashing, type this command
```bash
$ powerline-daemon --replace
```
## Customize Powerline
```
/usr/local/lib/python3.7/dist-packages/powerline/config_files
```
