FROM python:3.7-stretch

RUN \
    apt-get -y update \
    && apt install -y postgresql-client cron \
    && rm -rf /var/lib/apt/lists/*

RUN \
    pip install --upgrade pip \
    && pip install -U setuptools

ENV ROOT_APP_DIR /home/src

WORKDIR $ROOT_APP_DIR

COPY requirements requirements
COPY scripts scripts

RUN pip install -r requirements/common.txt

EXPOSE 8889
CMD ["bash"]