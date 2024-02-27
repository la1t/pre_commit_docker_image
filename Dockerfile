ARG PYTHON_VERSION
ARG PRE_COMMIT_VERSION

FROM python:${PYTHON_VERSION}-slim

ENV PYTHONUNBUFFERED=1 \
    # prevents python creating .pyc files
    PYTHONDONTWRITEBYTECODE=1 \
    # pip
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    # pre-commit
    PRE_COMMIT_VERSION=${PRE_COMMIT_VERSION}

RUN apt-get update && \
    apt-get install -y --no-install-recommends git gcc libc-dev libffi-dev && \
    apt-get purge -y --auto-remove -o APT:AutoRemove:RecommendsImportant=false && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache pre-commit==${PRE_COMMIT_VERSION} && \
    pre-commit --version
