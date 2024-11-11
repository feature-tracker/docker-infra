# Docker Infra for Feature Tracker
This repository contains the docker compose based infrastructure for running Feature Tracker application.

## Prerequisites
* JDK 21 or later
* Docker ([installation instructions](https://docs.docker.com/engine/install/))
* [Taskfile](https://taskfile.dev/)

## How to get started?

```shell
$ git clone https://github.com/feature-tracker/docker-infra.git
$ cd docker-infra

# Start application-dependent services (PostgreSQL, Keycloak, etc)
$ task start_infra

# Start applications and their dependent services (feature-service, api-gateway, etc)
$ task start
```

## Keycloak Export

Source: https://github.com/keycloak/keycloak/issues/33800

```shell
docker ps

docker exec -it <container_id> sh -c \
  "cp -rp /opt/keycloak/data/h2 /tmp ; \
  /opt/keycloak/bin/kc.sh export --dir /opt/keycloak/data/import --realm feature-tracker --users realm_file \
    --db dev-file \
    --db-url 'jdbc:h2:file:/tmp/h2/keycloakdb;NON_KEYWORDS=VALUE'"

docker cp <container_id>:/opt/keycloak/data/import/feature-tracker-realm.json ~/Downloads/feature-tracker-realm.json
```