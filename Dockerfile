FROM ghcr.io/appleboy/azure-blob-storage:0.1.2

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
