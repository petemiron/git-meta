# CLI Test and Benchmark Harness

This directory contains a comprehensive CLI testing and benchmarking harness using industry-standard tools. It's designed to help you test and benchmark command-line interfaces effectively.

## Overview

The harness includes three main components:

1. **Bats Tests** (`test_bats.bats`) - Bash Automated Testing System for functional testing
2. **ShellSpec Tests** (`test_shellspec.sh`) - Modern shell script testing framework  
3. **Hyperfine Benchmarks** (`benchmark_example.sh`) - Command-line benchmarking tool

## Quick Start

### Prerequisites

The testing tools are automatically installed in the Codespaces environment. For local development, install:

- [Bats](https://bats-core.readthedocs.io/) - `npm install -g bats` or use package manager
- [ShellSpec](https://shellspec.info/) - `curl -fsSL https://git.io/shellspec | sh`
- [Hyperfine](https://github.com/sharkdp/hyperfine) - Available in most package managers

### Setup

1. **Replace the placeholder command**: Update `./your_cli_command` in all test files with your actual CLI executable path.

2. **Make your CLI executable**: Ensure your command has execute permissions:
   ```bash
   chmod +x ./your_cli_command
   ```

### Running Tests

#### Bats Tests
```bash
# Run all Bats tests
bats test/cli/test_bats.bats

# Run with verbose output
bats --verbose test/cli/test_bats.bats

# Run specific test by line number
bats test/cli/test_bats.bats --filter "CLI command exists"
```

#### ShellSpec Tests
```bash
# Run all ShellSpec tests
shellspec test/cli/test_shellspec.sh

# Run with coverage report
shellspec --kcov test/cli/test_shellspec.sh

# Run in documentation format
shellspec --format documentation test/cli/test_shellspec.sh
```

#### Hyperfine Benchmarks
```bash
# Run benchmark suite
./test/cli/benchmark_example.sh

# Run individual benchmarks
hyperfine './your_cli_command --help'
hyperfine --warmup 3 './your_cli_command --version'
```

## Test Structure

### Bats Tests (`test_bats.bats`)

Functional tests that verify:
- Command existence and executability
- Basic help and version functionality
- Error handling for invalid arguments
- Core functionality validation

Example test:
```bash
@test "CLI command shows help when called with --help" {
    run ./your_cli_command --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Usage:" ]] || [[ "$output" =~ "help" ]]
}
```

### ShellSpec Tests (`test_shellspec.sh`)

Behavior-driven development style tests with:
- Descriptive test contexts and specifications
- Advanced output matching and validation
- Better error reporting and debugging
- Support for mocking and stubbing

Example test:
```bash
Describe 'CLI Command Tests'
  It 'should show help when called with --help'
    When call ./your_cli_command --help
    The status should be success
    The output should include "help"
  End
End
```

### Hyperfine Benchmarks (`benchmark_example.sh`)

Performance benchmarking that provides:
- Statistical analysis of execution times
- Warmup runs to avoid cold start effects
- Export to JSON and Markdown formats
- Comparison between different command variations

## Extending the Test Suite

### Adding New Bats Tests

1. Add new `@test` blocks to `test_bats.bats`:
```bash
@test "Your new test description" {
    # Test setup
    run ./your_cli_command your_args
    
    # Assertions
    [ "$status" -eq 0 ]
    [[ "$output" =~ "expected_pattern" ]]
}
```

### Adding New ShellSpec Tests

1. Add new test contexts to `test_shellspec.sh`:
```bash
Context 'when testing new feature'
  It 'should behave correctly'
    When call ./your_cli_command new_feature
    The status should be success
    The output should equal "expected output"
  End
End
```

### Adding New Benchmarks

1. Modify `benchmark_example.sh` or create new benchmark scripts:
```bash
hyperfine --warmup 3 --min-runs 10 \
    --export-json my_benchmark.json \
    './your_cli_command new_feature'
```

## Best Practices

### Test Organization
- Group related tests in contexts/describes
- Use descriptive test names
- Test both success and failure cases
- Test edge cases and error conditions

### Performance Testing
- Use warmup runs to avoid cold start bias
- Run multiple iterations for statistical significance
- Test with realistic data sizes and scenarios
- Document performance requirements and expectations

### Maintenance
- Keep tests up to date with CLI changes
- Use meaningful assertions and error messages
- Mock external dependencies when possible
- Document test dependencies and setup requirements

## CI Integration

The tests are automatically run in GitHub Actions via `.github/workflows/cli-test.yml`. The workflow:
- Sets up the testing environment
- Installs required tools
- Runs both Bats and ShellSpec tests
- Reports results and failures

## Troubleshooting

### Common Issues

1. **Command not found**: Ensure `./your_cli_command` points to the correct executable
2. **Permission denied**: Run `chmod +x ./your_cli_command`
3. **Tests failing**: Check that your CLI command supports `--help` and `--version` flags
4. **Benchmark errors**: Verify Hyperfine is installed and your command is executable

### Getting Help

- [Bats Documentation](https://bats-core.readthedocs.io/)
- [ShellSpec Documentation](https://shellspec.info/)
- [Hyperfine Documentation](https://github.com/sharkdp/hyperfine)

## Example Output

### Bats Test Output
```
 ✓ CLI command exists and is executable
 ✓ CLI command shows help when called with --help
 ✓ CLI command shows version when called with --version
 ✓ CLI command fails gracefully with invalid arguments

4 tests, 0 failures
```

### ShellSpec Test Output
```
CLI Command Tests
  when checking basic functionality
    should exist and be executable
    should show help when called with --help
    should show version information when called with --version

Finished in 0.12345 seconds (files took 0.67890 seconds to load)
3 examples, 0 failures
```

### Hyperfine Benchmark Output
```
Benchmark #1: ./your_cli_command --help
  Time (mean ± σ):      12.3 ms ±   1.2 ms    [User: 8.1 ms, System: 4.2 ms]
  Range (min … max):    10.1 ms …  15.7 ms    10 runs
```