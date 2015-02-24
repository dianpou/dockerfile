FROM dianpou/ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

RUN apt-get update
RUN apt-get upgrade
RUN apt-get autoremove -y --purge mysql-client
RUN DEBIAN_FRONTEND=noninteractive && apt-get install -y mysql-server-5.6

RUN rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
    sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf
RUN cp /etc/mysql/my.cnf /usr/share/mysql/my-default.cnf

COPY mysql.conf /etc/supervisor/conf.d/
COPY mysql_init_datadir /usr/bin/mysql_init_datadir
RUN chmod a+x /usr/bin/mysql_init_datadir
RUN /usr/bin/mysql_init_datadir

VOLUME ["/etc/mysql", "/var/lib/mysql"]
WORKDIR /etc/mysql

CMD supervisord -n

EXPOSE 3306
