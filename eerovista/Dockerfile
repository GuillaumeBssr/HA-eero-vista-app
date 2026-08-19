FROM python:3.11-slim-bookworm

ARG EEROVISTA_REF=v2.9.7

ENV PYTHONUNBUFFERED=1 \
    DATABASE_PATH=/data/eerovista.db

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gcc \
       g++ \
       git \
       libffi-dev \
       libffi8 \
       curl \
       nginx-light \
       supervisor \
    && git clone --depth 1 --branch "${EEROVISTA_REF}" https://github.com/Yeraze/eeroVista.git /tmp/eerovista \
    && pip install --no-cache-dir -r /tmp/eerovista/requirements.txt \
    && cp -a /tmp/eerovista/. /app/ \
    && rm -rf /tmp/eerovista /app/.git \
    && apt-get purge -y --auto-remove gcc g++ libffi-dev git \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
COPY supervisord.conf /etc/supervisor/conf.d/eerovista.conf
COPY ingress.conf /etc/nginx/sites-available/default
RUN chmod 0755 /run.sh \
    && mkdir -p /run/nginx /var/log/supervisor

EXPOSE 8080 8099

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 \
  CMD curl -f http://localhost:8080/api/health || exit 1

CMD ["/run.sh"]
