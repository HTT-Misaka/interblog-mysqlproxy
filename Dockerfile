from nginx:latest
run mkdir -p /usr/local/lua && \
    mkdir -p /opt/mysql-proxy/mysql-proxy-0.8.5-linux-el6-x86-64bit && \
    mkdir -p /opt/mysql-proxy/mysql-proxy085 && \
    mkdir -p /opt/mysql-proxy/mysql-proxy085/bin
copy lua/lua /usr/local/lua
ENV LUA_HOME /usr/local/lua
ENV PATH $PATH:$LUA_HOME/bin
copy mysql-proxy-0.8.5-linux-el6-x86-64bit /opt/mysql-proxy/mysql-proxy-0.8.5-linux-el6-x86-64bit
copy mysql-proxy085 /opt/mysql-proxy/mysql-proxy085
ENV PATH /opt/mysql-proxy/mysql-proxy085/bin/:$PATH
add mysql-proxy.cnf /etc/mysql-proxy.cnf
run chmod 660 /etc/mysql-proxy.cnf
cmd ["/opt/mysql-proxy/mysql-proxy085/bin/mysql-proxy","--defaults-file=/etc/mysql-proxy.cnf"]

