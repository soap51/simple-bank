createdb:
	docker exec -it pq createdb --username=boss simple_bank

dropdb:
	docker exec -it pq dropdb --username=boss simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://boss:boss@localhost:5432/simplebank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:	
	mockgen -package mockdb -destination db/mockdb/Store.go github.com/soap51/simple-bank/db/sqlc Store

.PHONY: createdb dropdb migrateup migratedown sqlc server mock migrateup1 migratedown1