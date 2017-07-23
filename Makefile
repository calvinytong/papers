REPO=quay.io/calvinytong/papers
VERSION=0.1

.DEFAULT_GOAL := help

run: ## run the image
	docker run -it ${REPO}:${VERSION}

build: ## build the default image
	docker build -t ${REPO}:${VERSION} .

push: ## push the image
	docker push ${REPO}:${VERSION}

help: ## show this documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "   \033[36m%-20s\033[0m %s\n", $$1, $$2}'
