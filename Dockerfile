FROM elasticsearch:2.4

# configure plugins
RUN /usr/share/elasticsearch/bin/plugin install analysis-icu

USER root

RUN chgrp -R 0 /usr/share/elasticsearch && \
    chmod -R g+rw /usr/share/elasticsearch && \
    find /usr/share/elasticsearch -type d -exec chmod g+x {} + && \
    ulimit -n 65536 && \
    ulimit -u 2048 && \
    echo "*  -  nofile  65536" >> /etc/security/limits.conf

USER 1001
