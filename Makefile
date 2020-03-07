.PHONY: clean build deploy

clean:
	rm -f bin/lambda-go-api

build:
	GOOS=linux GOARCH=amd64 go build -o bin/lambda-go-api ./cmd/lambda-go-api/

deploy: clean build
	sam deploy --confirm-changeset -t template.yaml
