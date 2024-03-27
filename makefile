build:
	go build -o ./.bin/app ./cmd/main.go

run: build
	./.bin/app

docker-build:
	docker build -t crud:v1.0 .

docker-run:
	docker run --name crud1.0 -p 8080:80 crud:v1.0