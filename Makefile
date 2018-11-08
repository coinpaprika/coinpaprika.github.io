PROJECT_NAME            = coinpaprika.github.io
PROJECT_DIR             = $(GOPATH)/src/github.com/coinpaprika/$(PROJECT_NAME)
MAIN_PROGRAM_PATH       = $(PROJECT_DIR)/server.go

help: ## this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

run: ## run server with documentation and swagger-ui
	docker-compose --file=docker-compose.yml down
	docker-compose --file=docker-compose.yml build
	docker-compose --file=docker-compose.yml up -d
	sleep 3
	open http://localhost:1400
	open http://localhost:1401

stop:
	docker-compose --file=docker-compose.yml down

run_server: ## run server with documentation
	go run $(MAIN_PROGRAM_PATH)



