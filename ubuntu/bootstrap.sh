#!/bin/bash

set -e
if [ "$USER" ]; then
	adduser -q --disabled-password --shell /bin/zsh --gecos '' $USER
	adduser -q $USER sudo
	echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
	zsh -c 'cp -r /root/.zprezto /home/$USER/.zprezto;chown -R $USER:$USER /home/$USER/.zprezto;'
        su $USER -c 'setopt EXTENDED_GLOB; for rcfile in ${ZDOTDIR:-$HOME}/.zprezto/runcoms/^README.md(.N); do ln -s $rcfile ${ZDOTDIR:-$HOME}/.${rcfile:t}; done;'
        #su $USER -c 'setopt EXTENDED_GLOB;  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";  done;'
        cd /home/$USER;
	su $USER -c "$*"
else
        exec "$@"
fi
