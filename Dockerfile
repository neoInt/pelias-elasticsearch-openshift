FROM elasticsearch:2.4

# configure plugins
RUN /usr/share/elasticsearch/bin/plugin install analysis-icu

USER 1001