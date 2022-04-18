FROM python:3.10-alpine3.15

RUN apk add --no-cache git gcc libc-dev libffi-dev && \
    pip install --no-cache pre-commit
