run-database:
	@docker-compose up

exec-sql:
	@PGPASSWORD=postgrespassword psql -p 25432 -h 127.0.0.1 -U postgres -f $(FILE)

migrate-up:
	@for f in `ls migrations/**/up.sql`; do export PGPASSWORD=postgrespassword; psql -p 25432 -h 127.0.0.1 -U postgres -f $$f; done

migrate-down:
	@for f in `ls -r migrations/**/down.sql`; do export PGPASSWORD=postgrespassword; psql -p 25432 -h 127.0.0.1 -U postgres -f $$f; done
