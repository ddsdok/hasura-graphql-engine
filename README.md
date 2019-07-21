# hasura-graphql-engine

Docker image with a hasura-graphql-engine that correctly load migrations.

I've created this docker image, because I've been having some problems,
when configurating new databases migrated from others.

The problem is: migrations can be applied, but only once. If database
is deleted and container is restarted, the migrations won't be applied.

So, this docker image simply overrides
hasura/graphql-engine:v1.0.0-beta.3.cli-migrations docker image, adding
a modified shell script to run the migrations.

The new script `run-migrations.sh` download two migration files:

- **schema.up.sql**: a SQL schema available for download at
$SCHEMA_FILE variable.

- **metadata.up.yaml**: metadata available for download at
$METADATA_FILE variable.

After downloading each file, the script will rename then to a random
version, enabling them to be applied as migration for hasura database.
