# export

```
yay -Qqen > packages-repository.txt
yay -Qqem > packages-AUR.txt
```

# import

```
yay --needed -S - < packages-repository.txt
cat packages-AUR.txt | xargs yay -S --needed --noconfirm
```
