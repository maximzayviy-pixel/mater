FROM mattermost/mattermost-team-edition:latest

# Copy custom entrypoint to compose DB connection string from env
COPY entrypoint.sh /mm-entrypoint.sh
RUN chmod +x /mm-entrypoint.sh

EXPOSE 8065
CMD ["/mm-entrypoint.sh"]
