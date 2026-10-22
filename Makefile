PYTHON := python3

.PHONY: help generate test build check release-dry

help:
	@echo "Available targets:"
	@echo "  make generate          - regenerate Swift endpoints/tests/docs"
	@echo "  make test              - run XCTest suite"
	@echo "  make build             - build Swift package"
	@echo "  make check             - generate + test + build"
	@echo "  make release-dry       - semantic-release dry run"

generate:
	$(PYTHON) scripts/generate_endpoints.py

test:
	swift test

build:
	swift build

check: generate test build

release-dry:
	npx semantic-release --dry-run
