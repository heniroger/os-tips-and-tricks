# SSH Tips
## multiple ssh key check

```
$ vim ~/.ssh/config
```
- Add this configuration
```yml
Host github.com
    User git
    Hostname github.com
    IdentityFile ~/.ssh/custom_rsa
Host github.com
    User custom_user
    Hostname github.com
    IdentityFile ~/.ssh/custom2_rsa
```
- Type this command
```
$ chmod 400 ~/.ssh/config
```
