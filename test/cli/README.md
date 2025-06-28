# CLI Testing for git-meta

This directory contains CLI tests for the git-meta tool using the Bats testing framework.

## Overview

The harness includes:

1. **Bats Tests** (`test_bats.bats`) - Functional tests for git-meta CLI commands
2. **Benchmarks** (`benchmark_example.sh`) - Performance benchmarking (optional)

## Prerequisites

The tests require:
- Node.js 18+ 
- npm dependencies installed (`npm install --legacy-peer-deps` in the `node/` directory)
- Bats testing framework
- System dependencies for nodegit compilation (pkg-config, libssl-dev, etc.)

All of these are automatically installed if you're using the provided devcontainer.

## Quick Start

### Setup

The git-meta CLI is located at `../../node/bin/git-meta` relative to this test directory.

### Running Tests

#### Bats Tests
```bash
# Run all CLI tests
cd test/cli
bats test_bats.bats

# Run with verbose output
bats --verbose-run test_bats.bats

# Run specific test
bats --filter "git-meta command exists" test_bats.bats
```

#### Hyperfine Benchmarks (Optional)
```bash
# Run benchmark suite
./benchmark_example.sh

# Run individual benchmarks
hyperfine '../../node/bin/git-meta --help'
hyperfine --warmup 3 '../../node/bin/git-meta version'
```

## Test Coverage

The CLI tests verify:

1. **Basic functionality**:
   - git-meta binary exists and is executable
   - Help output works (`--help`)
   - Version information (`version` command)

2. **Error handling**:
   - Invalid flags fail gracefully
   - Empty arguments show usage

3. **Command recognition**:
   - `open` command is recognized
   - `checkout` command is recognized  
   - `commit` command is recognized
   - `push` command is recognized

## Development Environment

To recreate the development environment:

1. Open this repository in VS Code
2. When prompted, choose "Reopen in Container"
3. The devcontainer will automatically:
   - Install system dependencies (pkg-config, libssl-dev, etc.)
   - Install testing tools (Bats, ShellSpec, Hyperfine)
   - Install npm dependencies with `--legacy-peer-deps`
   - Verify git-meta is working

Or manually rebuild the container:
```bash
# From VS Code Command Palette
> Dev Containers: Rebuild Container
```

## System Dependencies

git-meta requires these system packages for nodegit compilation:
- `pkg-config`
- `libssl-dev` 
- `zlib1g-dev`
- `file`
- `build-essential`
- `python3`
- `cmake`

These are automatically installed via the devcontainer setup.