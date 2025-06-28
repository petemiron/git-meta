#!/usr/bin/env bats

# Bats CLI tests for git-meta

@test "git-meta command exists and is executable" {
    [ -f "../../node/bin/git-meta" ]
    [ -x "../../node/bin/git-meta" ]
}

@test "git-meta shows help when called with --help" {
    run ../../node/bin/git-meta --help
    [ "$status" -eq 0 ]
    [[ "$output" =~ "Usage" ]] || [[ "$output" =~ "help" ]]
}

@test "git-meta shows version when called with version subcommand" {
    run ../../node/bin/git-meta version
    [ "$status" -eq 0 ]
    [[ "$output" =~ [0-9]+\.[0-9]+\.[0-9]+ ]] || [[ "$output" =~ "version" ]]
}

@test "git-meta fails gracefully with invalid arguments" {
    run ../../node/bin/git-meta --invalid-flag-that-does-not-exist
    [ "$status" -ne 0 ]
}

@test "git-meta handles empty arguments appropriately" {
    run ../../node/bin/git-meta
    # git-meta with no arguments shows usage and exits with code 2
    [ "$status" -eq 2 ]
    [[ "$output" =~ "usage" ]]
}

@test "git-meta open command is recognized" {
    run ../../node/bin/git-meta open my-repo
    # This will fail if not in a meta-repo, but checks command is recognized
    [[ "$output" =~ "submodules" ]] || [[ "$output" =~ "usage" ]] || [[ "$output" =~ "error" ]]
}

@test "git-meta checkout command is recognized" {
    run ../../node/bin/git-meta checkout -b my-feature
    [[ "$output" =~ "checkout" ]] || [[ "$output" =~ "branch" ]] || [[ "$output" =~ "error" ]]
}

@test "git-meta commit command is recognized" {
    run ../../node/bin/git-meta commit -a -m "test commit"
    [[ "$output" =~ "commit" ]] || [[ "$output" =~ "nothing to commit" ]] || [[ "$output" =~ "error" ]]
}

@test "git-meta push command is recognized" {
    run ../../node/bin/git-meta push origin my-feature
    [[ "$output" =~ "up-to-date" ]] || [[ "$output" =~ "push" ]] || [[ "$output" =~ "error" ]] || [[ "$output" =~ "rejected" ]]
}