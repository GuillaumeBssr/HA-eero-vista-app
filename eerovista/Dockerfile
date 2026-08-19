FROM ghcr.io/yeraze/eerovista:v2.9.7

ENV PYTHONUNBUFFERED=1 \
    DATABASE_PATH=/data/eerovista.db

WORKDIR /app

COPY run.sh /run.sh
COPY supervisord.conf /etc/supervisor/conf.d/eerovista.conf
RUN chmod 0755 /run.sh

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:8080/api/health || exit 1

CMD ["/run.sh"]
