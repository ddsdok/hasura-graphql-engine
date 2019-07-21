FROM hasura/graphql-engine:v1.0.0-beta.3.cli-migrations

ENV HASURA_GRAPHQL_CLI_ENVIRONMENT=server-on-docker

# Run new version of docker-entrypoint
ADD ./run-migrations.sh /bin/
RUN chmod +x /bin/run-migrations.sh

ENTRYPOINT [ "sh", "/bin/run-migrations.sh" ]
CMD ["graphql-engine", "serve"]