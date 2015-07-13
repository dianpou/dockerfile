FROM ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list 
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y build-essential software-properties-common byobu curl git htop man unzip vim wget zsh exuberant-ctags openssh-server supervisor mysql-client postgresql-client ruby ruby-dev ruby-bundler python python-dev python-pip python-virtualenv openssh-server
RUN rm -rf /var/lib/apt/lists/*

# prezto
RUN \
  zsh -c 'git clone --recursive https://github.com/garbin/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"; setopt EXTENDED_GLOB;  for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}";  done;  chsh -s /bin/zsh'
#COPY prompt_garbin_setup /root/.zprezto/modules/prompt/functions/
#RUN sed -ri "s/theme 'sorin'/theme 'garbin'/g" ~/.zpreztorc
#RUN sed -ri "s/'completion'/'completion' 'syntax-highlighting' 'history-substring-search'/g" ~/.zpreztorc

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install -y nodejs
RUN npm install -g bower gulp browserify

# vimrc
RUN \
  git clone --recursive git://github.com/garbin/vimrc.git ~/.vim_runtime && \
  sh ~/.vim_runtime/install_awesome_vimrc.sh
COPY my_configs.vim /root/.vim_runtime/

# supervisor
RUN sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

VOLUME ["/etc/supervisor/conf.d"]
ADD ./sshd.conf /etc/supervisor/conf.d/sshd.conf
RUN mkdir /var/run/sshd
WORKDIR /root
ADD ./bootstrap.sh /bootstrap.sh
RUN chmod a+x /bootstrap.sh

ENTRYPOINT ["/bootstrap.sh"]
CMD ["zsh"]
