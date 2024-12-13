SOURCES := .

.DEFAULT_GOAL := install-dev-deps

install-dev-deps: dev-deps
	uv pip sync requirements.txt dev-requirements.txt

install-deps: deps
	uv pip sync requirements.txt

deps:
	uv pip compile --output-file=requirements.txt pyproject.toml

dev-deps: deps
	uv pip compile --extra=dev --output-file=dev-requirements.txt pyproject.toml

fmt:
	ruff format $(SOURCES)
	ruff check --fix --unsafe-fixes $(SOURCES)

lint:
	ruff format --check $(SOURCES)
	ruff check $(SOURCES)
	mypy
