FROM dockerfile/ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

# COPY sources.list /etc/apt/

RUN \
  apt-get update && \
  apt-get -y dist-upgrade && \
  apt-get install -y zsh exuberant-ctags openssh-server supervisor mysql-client postgresql-client && \
  rm -rf /var/lib/apt/lists/*

# prezto
RUN \
  zsh -c 'git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"; setopt EXTENDED_GLOB;  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";  done;  chsh -s /bin/zsh'
COPY prompt_garbin_setup /root/.zprezto/modules/prompt/functions/
RUN sed -ri "s/theme 'sorin'/theme 'garbin'/g" ~/.zpreztorc

# vimrc
RUN \
  git clone --recursive git://github.com/garbin/vimrc.git ~/.vim_runtime && \
  sh ~/.vim_runtime/install_awesome_vimrc.sh
COPY my_configs.vim /root/.vim_runtime/

# supervisor
RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

VOLUME ["/etc/supervisor/conf.d"]

WORKDIR /root

CMD zsh
