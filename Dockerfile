FROM elasticsearch:2.4

ADD config/elasticsearch.yml /usr/share/elasticsearch/config/
RUN mkdir /usr/share/elasticsearch/schema
ADD schema/pelias-schema.json /usr/share/elasticsearch/schema/
ADD create-index.sh /usr/share/elasticsearch/
RUN chmod +wx /usr/share/elasticsearch/plugins/
RUN /usr/share/elasticsearch/bin/plugin install analysis-icu

USER root

RUN chgrp -R 0 /usr/share/elasticsearch && \
    chmod -R g+rw /usr/share/elasticsearch && \
    find /usr/share/elasticsearch -type d -exec chmod g+x {} + && \
    ulimit -n 65536 && \
    echo "*  -  nofile  65536" >> /etc/security/limits.conf

ENV CLUSTER_NAME="gazetteer"
ENV DISCOVERY_SERVICE="127.0.0.1"

USER 1001
