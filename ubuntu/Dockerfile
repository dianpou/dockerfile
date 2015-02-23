FROM dockerfile/ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

# COPY sources.list /etc/apt/

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y zsh exuberant-ctags openssh-server mysql-client postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# prezto
RUN \
  zsh -c 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"; setopt EXTENDED_GLOB;  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";  done;  chsh -s /bin/zsh'


# vimrc
RUN \
  git clone git://github.com/amix/vimrc.git ~/.vim_runtime && \
  sh ~/.vim_runtime/install_awesome_vimrc.sh

COPY prompt_garbin_setup /root/.zprezto/modules/prompt/functions/
COPY my_configs.vim /root/.vim_runtime/
RUN sed -ri "s/theme 'sorin'/theme 'garbin'/g" ~/.zpreztorc

WORKDIR /root

CMD zsh
