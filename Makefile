.DEFAULT_GOAL := help

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.PHONY: start-docker
start-docker: ## Run app.py
	docker run -v ${PWD}:/tmp/working -w=/tmp/working/src/kaggle_m5_forecasting --rm -it gcr.io/kaggle-images/python:v77 python app.py

.PHONY: start-gpu
start-gpu: ## Run app.py with gpu
	docker run -v ${PWD}:/tmp/working -w=/tmp/working/src/kaggle_m5_forecasting --rm -it gcr.io/kaggle-gpu-images/python:v37 python app.py

.PHONY: test
test: ## Run test
	echo test
