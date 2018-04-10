BINARY_NAME = $(shell pwd | sed 's:.*/::')

build:
	@go build -o main -v ./...

serve: 
	@go run server/*.go

docker:
	@docker build -t $(BINARY_NAME) .
	@docker run -d -p 4000:3000 --name $(BINARY_NAME) $(BINARY_NAME)