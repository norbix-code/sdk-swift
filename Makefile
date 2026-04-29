PYTHON := python3

.PHONY: help sync-types sync-types-update generate test build check release-dry

help:
	@echo "Available targets:"
	@echo "  make sync-types        - generate Swift ServiceStack references with x tool"
	@echo "  make sync-types-update - update existing *.dtos.swift references with x tool"
	@echo "  make generate          - regenerate Swift endpoints/tests/docs"
	@echo "  make test              - run XCTest suite"
	@echo "  make build             - build Swift package"
	@echo "  make check             - generate + test + build"
	@echo "  make release-dry       - semantic-release dry run"

sync-types:
	$(PYTHON) scripts/sync_types.py

sync-types-update:
	$(PYTHON) scripts/sync_types.py --update-only

generate:
	$(PYTHON) scripts/generate_endpoints.py

test:
	swift test

build:
	swift build

check: generate test build

release-dry:
	npx semantic-release --dry-run
