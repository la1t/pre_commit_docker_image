ARG PYTHON_VERSION
ARG PRE_COMMIT_VERSION

FROM python:${PYTHON_VERSION}-alpine

RUN apk add --no-cache git gcc libc-dev libffi-dev && \
    pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache pre-commit==${PRE_COMMIT_VERSION}
