.PHONY: help install lint test clean docs

# Default target
.DEFAULT_GOAL := help

help: ## Show this help message
	@echo "Ansible Security Baseline - Available Commands"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "%-20s %s\n", $$1, $$2}'

install: ## Install development dependencies
	@echo "Installing Python dependencies..."
	pip install -r requirements.txt
	@echo "Installing Ansible collections..."
	ansible-galaxy collection install -r requirements.yml
	@echo "Installation complete"

lint: ## Run linting (ansible-lint and yamllint)
	@echo "Running ansible-lint..."
	ansible-lint
	@echo "Running yamllint..."
	yamllint . || true
	@echo "Linting complete"

syntax: ## Check playbook syntax
	@echo "Checking syntax..."
	ansible-playbook site.yml --syntax-check
	@echo "Syntax check passed"

test: ## Run Molecule tests
	@echo "Running Molecule tests..."
	molecule test
	@echo "Tests complete"

test-converge: ## Run only Molecule converge (faster iteration)
	@echo "Running Molecule converge..."
	molecule converge
	@echo "Converge complete"

test-verify: ## Run only Molecule verify
	@echo "Running Molecule verify..."
	molecule verify
	@echo "Verify complete"

clean: ## Clean up Molecule artifacts and cache
	@echo "Cleaning up..."
	molecule destroy || true
	rm -rf .molecule/
	rm -rf .cache/
	find . -type f -name "*.pyc" -delete
	find . -type d -name "__pycache__" -delete
	@echo "Cleanup complete"

dry-run: ## Run playbook in check mode
	@echo "Running dry-run (check mode)..."
	ansible-playbook site.yml -i inventory.example --check
	@echo "Dry-run complete"

deploy-dev: ## Deploy to development environment
	@echo "Deploying to development..."
	ansible-playbook site.yml -i inventory --limit development

deploy-staging: ## Deploy to staging environment
	@echo "Deploying to staging..."
	ansible-playbook site.yml -i inventory --limit staging

deploy: ## Deploy security baseline (production)
	@echo "WARNING: This will apply security hardening to production servers!"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [ "$$REPLY" = "y" ] || [ "$$REPLY" = "Y" ]; then \
		ansible-playbook site.yml -i inventory; \
	fi

version: ## Display version information
	@echo "Ansible Security Baseline"
	@echo "Version: 1.0.0"
	@ansible --version | head -1
	@python --version

stats: ## Show project statistics
	@echo "Project Statistics:"
	@echo "Total files: $$(find . -type f | wc -l)"
	@echo "YAML files: $$(find . -name '*.yml' -o -name '*.yaml' | wc -l)"
	@echo "Jinja2 templates: $$(find . -name '*.j2' | wc -l)"
