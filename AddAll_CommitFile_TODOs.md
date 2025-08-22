# Add `-A` and `-F <file>` Flags Feature Tracking

This document tracks the implementation and integration of:
- `-A` flag: Stage/commit all changes across submodules
- `-F <file>` flag: Use a file for the commit message

## Feature Goals

- Enhance `add` and `commit` commands to support new flags for improved workflows.
- Ensure robust argument parsing, help updates, and full test coverage.

---

## Affected Files

- `node/lib/cmd/add.js`
- `node/lib/cmd/commit.js`
- `node/test/util/add.js`
- `node/test/util/commit.js`
- Documentation/help files as needed

---

## TODO Checklist

| Status      | Task                                                                                         | Responsible | Notes                      |
|-------------|----------------------------------------------------------------------------------------------|-------------|----------------------------|
| ⬜️         | Update argument parsing in `add.js` to support `-A`                                           | copilot      |                            |
| ⬜️         | Update logic in `add.js` to stage all across submodules when `-A` is supplied                 | copilot      |                            |
| ⬜️         | Update argument parsing in `commit.js` to support `-A` and `-F <file>`                        | copilot      |                            |
| ⬜️         | Implement logic for `-A` in `commit.js` to commit all changes                                 | copilot      |                            |
| ⬜️         | Implement logic for `-F <file>` in `commit.js` to use commit message from file                | copilot      |                            |
| ⬜️         | Update help and documentation for both commands                                               | copilot      |                            |
| ⬜️         | Add/modify tests in `add.js` and `commit.js` to verify new flag behavior                      | copilot      |                            |
| ⬜️         | Final review and refactor                                                                     | copilot      |                            |

---

## Status Updates

- **2025-08-22:** Branch created. TODO file initialized.

---

## Notes

- Please add comments, decisions, or implementation details below as work progresses!