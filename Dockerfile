FROM mattermost/mattermost-team-edition:9.11.3-alpine

# Copy custom entrypoint (handles DB env & waits for Postgres)
COPY entrypoint.sh /mm-entrypoint.sh
RUN chmod +x /mm-entrypoint.sh

EXPOSE 8065
ENTRYPOINT ["/mm-entrypoint.sh"]
