FROM mysql:5.7.17

ENV MYSQL_VERSION 5.7.17
ENV TRANSACTD_VERSION 3.7.2
ENV TRANSACTD_DOWNLOAD_MD5 8add3d8f700b8cc44ab2e935f51c13f5

# plugin-dir: mysqld --verbose --help | grep ^plugin-dir
RUN set -ex \
        && apt-get update \
        && apt-get install --no-install-recommends -y wget \
        && rm -rf /var/lib/apt/lists/* \
        && wget -O transactd.tar.gz "http://www.bizstation.jp/al/transactd/download/transactd-${TRANSACTD_VERSION}/transactd-linux-x86_64-${TRANSACTD_VERSION}_mysql-${MYSQL_VERSION}.tar.gz" \
        && echo "${TRANSACTD_DOWNLOAD_MD5} *transactd.tar.gz" | md5sum -c - \
        && tar xzf transactd.tar.gz -C /usr/lib/mysql/plugin/ --strip-components=1 transactd-linux-x86_64-${TRANSACTD_VERSION}_mysql-${MYSQL_VERSION}/libtransactd.so \
        && rm transactd.tar.gz \
        && /bin/echo -e '[mysqld]\nplugin-load=transactd=libtransactd.so' > /etc/mysql/conf.d/transactd.cnf \
        && apt-get purge -y --auto-remove wget

