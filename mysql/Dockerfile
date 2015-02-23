FROM dianpou/ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

RUN apt-get update
RUN apt-get upgrade
RUN apt-get autoremove -y --purge mysql-client
RUN DEBIAN_FRONTEND=noninteractive && apt-get install -y mysql-server-5.6

RUN rm -rf /var/lib/apt/lists/* && \
    sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf && \
    sed -i 's/^\(log_error\s.*\)/# \1/' /etc/mysql/my.cnf && \
    echo "mysqld_safe &" > /tmp/config && \
    echo "mysqladmin --silent --wait=30 ping || exit 1" >> /tmp/config && \
    echo "mysql -e 'GRANT ALL PRIVILEGES ON *.* TO \"root\"@\"%\" WITH GRANT OPTION;'" >> /tmp/config && \
    bash /tmp/config && \
    rm -f /tmp/config

COPY mysql.conf /etc/supervisor/conf.d/

VOLUME ["/etc/mysql", "/var/lib/mysql"]
WORKDIR /etc/mysql

CMD supervisord -n

EXPOSE 3306
