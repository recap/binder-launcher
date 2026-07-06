FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      git \
      curl \
      ca-certificates \
      docker-cli \
      mercurial \
    && rm -rf /var/lib/apt/lists/*

RUN python -m pip install --no-cache-dir jupyter-repo2docker

WORKDIR /src

COPY . /src

CMD ["repo2docker", "--debug", "--no-run", "--user-id", "1000", "--user-name", "jovyan", "/src"]
