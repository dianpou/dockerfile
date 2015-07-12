FROM dianpou/production

COPY sources.list /etc/apt/sources.list
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y proxychains

ENTRYPOINT ["/bootstrap.sh"]
CMD zsh -c "sudo supervisord -n"
