-include .env
export

start-db:
	docker-compose up -d postgres

run: start-db
	docker-compose run --rm go go run main.go search.go db.go --token=$(TWITTER_BEARER_TOKEN) --query="$(QUERY)"

log-postgres:
	docker-compose exec postgres tail -f /tmp/postgresql.log -n 100
