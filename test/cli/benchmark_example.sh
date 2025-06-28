#!/bin/bash

# Example Hyperfine benchmark script for git-meta
# Replace './your_cli_command' with your actual CLI executable

set -e

echo "=== CLI Performance Benchmarking ==="
echo "This script uses Hyperfine to benchmark your CLI command performance."
echo

# Check if hyperfine is available
if ! command -v hyperfine &> /dev/null; then
    echo "Error: hyperfine is not installed. Please install it first."
    echo "Installation: https://github.com/sharkdp/hyperfine"
    exit 1
fi

# Check if the CLI command exists
if [ ! -f "./your_cli_command" ]; then
    echo "Error: CLI command './your_cli_command' not found."
    echo "Please replace './your_cli_command' with your actual CLI executable path."
    exit 1
fi

if [ ! -x "./your_cli_command" ]; then
    echo "Error: CLI command './your_cli_command' is not executable."
    echo "Please make sure the file has execute permissions."
    exit 1
fi

echo "Benchmarking CLI command: ./your_cli_command"
echo

# Basic benchmark - help command (usually fast)
echo "--- Benchmark 1: Help Command Performance ---"
hyperfine --warmup 3 --min-runs 10 \
    --export-markdown results_help.md \
    --export-json results_help.json \
    './your_cli_command --help'

echo
echo "--- Benchmark 2: Version Command Performance ---"
hyperfine --warmup 3 --min-runs 10 \
    --export-markdown results_version.md \
    --export-json results_version.json \
    './your_cli_command --version'

# Example: Compare different command variations
echo
echo "--- Benchmark 3: Command Variations Comparison ---"
hyperfine --warmup 3 --min-runs 5 \
    --export-markdown results_comparison.md \
    --export-json results_comparison.json \
    --command-name "help" './your_cli_command --help' \
    --command-name "version" './your_cli_command --version'

# Example: Benchmark with different input sizes (if applicable)
echo
echo "--- Benchmark 4: Performance with Different Scenarios ---"
# Note: Adjust these commands based on your CLI's actual functionality
hyperfine --warmup 2 --min-runs 3 \
    --export-markdown results_scenarios.md \
    --export-json results_scenarios.json \
    --parameter-list size 1,10,100 \
    --command-name "scenario-{size}" \
    './your_cli_command --help'  # Replace with actual parameterized command

echo
echo "=== Benchmark Results ==="
echo "Results have been exported to:"
echo "  - results_help.md/json"
echo "  - results_version.md/json" 
echo "  - results_comparison.md/json"
echo "  - results_scenarios.md/json"
echo
echo "You can customize this script by:"
echo "1. Replacing './your_cli_command' with your actual CLI executable"
echo "2. Adding more specific benchmark scenarios"
echo "3. Adjusting warmup runs and minimum runs based on your needs"
echo "4. Adding parameterized tests for different input sizes or configurations"