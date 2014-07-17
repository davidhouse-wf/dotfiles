#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude ".vim" --exclude ".vimrc" --exclude "vimified" --exclude "README.md" --exclude "LICENSE-MIT.txt" -av --no-perms . ~
	source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

# set up vimified
ln -sfn $(pwd)/../vimified ~/.vim
ln -sfn $(pwd)/../vimified/vimrc ~/.vimrc
mkdir ~/.vim/tmp
mkdir ~/.vim/tmp/backup
mkdir ~/.vim/tmp/swap
mkdir ~/.vim/tmp/undo
git clone git@personal:gmarik/vundle.git ~/.vim/bundle/vundle
