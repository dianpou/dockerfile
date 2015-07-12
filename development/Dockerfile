FROM dianpou/production

RUN apt-get install openssh-server
COPY conf.d/sshd.conf /etc/supervisor/conf.d/sshd.conf

ENTRYPOINT ["/bootstrap.sh"]
CMD supervisord -n
