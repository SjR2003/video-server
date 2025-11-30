FROM jrottenberg/ffmpeg:4.4-alpine

WORKDIR /app

COPY start.sh /app/start.sh
COPY streams.yaml /app/streams.yaml

RUN chmod +x /app/start.sh

# videos directory will be mounted
VOLUME ["/videos"]

ENTRYPOINT ["/app/start.sh"]
CMD ["ffmpeg", "-version"]
