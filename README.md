# Slack Database Schema

This repository is a database schema of [Slack](https://slack.com) clone for testing and learning.
It works on [PostgreSQL](https://www.postgresql.org).

## Table and Relationships

![](https://github.com/ryicoh/slack-dbschema/blob/main/erd.png?raw=true)

## Getting Started

### Prerequisites

* [docker](https://www.docker.com)
* [docker-compose](https://docs.docker.com/compose/)
* [psql](https://www.postgresql.org/download/)

### Setup PostgreSQL

```
docker-compose up
```

### Migrate Database

```
make migrate-up
```

### Populate seed data

```
make exec-sql FILE=./seeds/1_all.sql
```
