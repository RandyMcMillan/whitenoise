######################
# Development
######################

# Clear local data dirs (ensure you're not running docker compose before running)
clear-dev-data:
    rm -rf ./dev/data/*

# Run integration_test binary using the local relays and data dirs
int-test:
    rm -rf ./dev/data/integration_test/
    RUST_LOG=critical,integration_test=debug cargo run --bin integration_test -- --data-dir ./dev/data/integration_test/ --logs-dir ./dev/data/integration_test/

# Run all tests (unit tests, integration tests, and doc tests)
test:
    RUST_LOG=error cargo test --all-features --all-targets
    RUST_LOG=error cargo test --all-features --doc

# Check clippy
check-clippy:
    @bash scripts/check-clippy.sh

# Check fmt
check-fmt:
    @bash scripts/check-fmt.sh

# Check docs
check-docs:
    @bash scripts/check-docs.sh

# Check all
check:
    @bash scripts/check-all.sh

# Run pre-commit checks (linting, formatting, docs, tests, integration tests)
precommit: check test int-test


######################
# Build
######################



######################
# Utilities
######################

# Publish a NIP-89 handler
publish-nip89:
    ./scripts/publish_nip89_handler.sh
