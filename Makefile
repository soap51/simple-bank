createdb:
	docker exec -it pq createdb --username=boss simple_bank

dropdb:
	docker exec -it pq dropdb --username=boss simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

.PHONY: createdb dropdb migrateup migratedown sqlc server