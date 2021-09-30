.DEFAULT_GOAL := help

# Determine this makefile's path.
# Be sure to place this BEFORE `include` directives, if any.
THIS_FILE := $(lastword $(MAKEFILE_LIST))
VERSION := 0.0.2
COMMIT := $(shell git describe --always --long --dirty)

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

clean-venv: ## re-create virtual env
	rm -rf .venv
	python3 -m venv .venv
	( \
       . .venv/bin/activate; \
       pip install --upgrade pip setuptools; \
       pip install -r requirements.txt; \
    )

clean-ansible: ## delete the $HOME/.ansible directory including galaxy-installed roles
	@rm -rf $${HOME}/.ansible


roles:  clean-venv ## install ansible roles from galaxy
	( \
       . .venv/bin/activate; \
       ansible-galaxy install -r ansible_requirements.yml; \
    )


test:
	@go test -short ${PKG_LIST}

lint:
	@for file in ${GO_FILES} ;  do \
		golint $$file ; \
	done

static: vet lint build


bump: clean-venv  ## bump version in main branch
ifeq ($(CURRENT_BRANCH), $(MAIN_BRANCH))
	( \
	   source .venv/bin/activate; \
	   pip install bump2version; \
	   bump2version $(part); \
	)
else
	@echo "UNABLE TO BUMP - not on Main branch"
	$(info Current Branch: $(CURRENT_BRANCH), main: $(MAIN_BRANCH))
endif


shellcheck: ## Run static code checks
	@echo Run shellcheck against scripts/
	shellcheck scripts/*.sh


.PHONY: run build release static upload vet lint