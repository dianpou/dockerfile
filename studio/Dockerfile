FROM dianpou/nginx-with-php

RUN apt-get install openssh-server
COPY conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf

CMD supervisord
