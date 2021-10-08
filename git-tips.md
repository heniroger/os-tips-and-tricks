## Update fork
```
$ git remote -v

origin	git@github.com:username/ForkedProject.git (fetch)
origin	git@github.com:username/ForkedProject.git (push)
```

```
$ git remote add upstream git@github.com:other_username/OriginalProject.git
$ git remote -v


origin	git@github.com:username/ForkedProject.git (fetch)
origin	git@github.com:username/ForkedProject.git (push)
upstream	git@github.com:other_username/OriginalProject.git (fetch)
upstream	git@github.com:other_username/OriginalProject.git (push)
```
```
$ git fetch upstream
$ git merge upstream/master #[or other upstream branch you need for ex: upstream/dev]
$ git push origin master
```

