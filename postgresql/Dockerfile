FROM dianpou/ubuntu

MAINTAINER Garbin Huang <garbinh@gmail.com>

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y postgresql-9.4 postgresql-contrib

RUN /etc/init.d/postgresql start
RUN sed -i -e"s/data_directory =.*$/data_directory = '\/var\/lib\/pgsql'/" /etc/postgresql/9.4/main/postgresql.conf
RUN echo "listen_addresses = '*'" >> /etc/postgresql/9.4/main/postgresql.conf
RUN echo 'local all all peer' >> /etc/postgresql/9.4/main/pg_hba.conf
RUN echo 'adminmap   postgres         postgres' >> /etc/postgresql/9.4/main/pg_ident.conf
RUN echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/9.4/main/pg_hba.conf
RUN chown -R postgres:postgres /var/lib/pgsql

ADD postgresql.conf /etc/supervisor/conf.d/
ADD postgresql-start.sh /etc/supervisor/conf.d/postgresql-start.sh
RUN chmod +x /etc/supervisor/conf.d/postgresql-start.sh

VOLUME ["/var/lib/pgsql", "/etc/postgresql"]
WORKDIR /etc/postgresql

CMD supervisord -n

EXPOSE 5432
