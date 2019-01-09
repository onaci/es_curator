# from https://github.com/elastic/curator/blob/5.x/Dockerfile

FROM python:3.6-alpine3.6
RUN apk --no-cache add ca-certificates
RUN pip install --quiet elasticsearch-curator
USER nobody:nobody
ENTRYPOINT ["/usr/local/bin/curator"]

WORKDIR /app
COPY . /app/
CMD ["--config", "/app/curator.yml", "/app/delete_indices.yml"]
