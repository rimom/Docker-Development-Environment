
FROM varnish:6.5

COPY ./start_logging.sh /usr/local/varnish/start_logging.sh
RUN chmod +x /usr/local/varnish/start_logging.sh

ENTRYPOINT ["/usr/local/varnish/start_logging.sh"]