FROM python:3.11.2

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ENTRYPOINT "./docker/python/entrypoint.sh"