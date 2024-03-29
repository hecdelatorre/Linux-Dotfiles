#!/bin/bash

cat > ~/.gitconfig << EOF
[user]
	name = user
	email = email@gmail.com
[alias]
	lg = log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) :: %C(white)%s%C(reset) %C(dim white) -> %an%C(reset)%C(bold yellow)%d%C(reset)' --all
	s = status -s -b
  a = add
  p = push
  c = commit
[credential]
	helper = cache --timeout=3600
[core]
	editor = nvim
[github]
	user = user
EOF
