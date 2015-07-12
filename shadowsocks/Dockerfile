FROM node:0.12-wheezy
RUN npm install -g shadowsocks
RUN touch /etc/shadowsocks.json

CMD sslocal -c /etc/shadowsocks.json
