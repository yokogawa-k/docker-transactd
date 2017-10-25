FROM mysql:5.7.20

ENV MYSQL_VERSION 5.7.20
ENV TRANSACTD_VERSION 3.8.0
ENV TRANSACTD_DOWNLOAD_MD5 873bb871b1875344f70854e68496e34d

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

