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

- Configure tmux
```bash
$ sudo apt-get update 
$ sudo apt-get install tmux
```
