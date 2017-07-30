REPO=quay.io/calvinytong/papers
VERSION=0.1

.DEFAULT_GOAL := help

install: install-python ## install all deps
	@echo "Installed Dependancies"

install-python: ## install python deps
	pip install -r requirements.txt

develop-ubuntu: ## setup development env for ubuntu
	bash scripts/build/setup_ubuntu.sh -w .
	venv/bin/pip install -r requirements.txt
	touch venv/bin/activate

run-docker: ## run the image
	docker run -it ${REPO}:${VERSION}

build-docker: ## build the default image
	docker build -t ${REPO}:${VERSION} .

push-docker: ## push the image
	docker push ${REPO}:${VERSION}

clean: ## cleanup
	@echo "Clean Up"

help: ## show this documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "   \033[36m%-20s\033[0m %s\n", $$1, $$2}'
