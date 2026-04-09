---
name: commit
description: Creates well-formatted commits with conventional commit messages
allowed-tools:
  [
    "Bash(git add:*)",
    "Bash(git status:*)",
    "Bash(git commit:*)",
    "Bash(git diff:*)",
    "Bash(git log:*)",
  ]
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

# Claude Command: Commit

Creates well-formatted commits with conventional commit messages and emoji.

## Usage

```
/commit
/commit --no-verify
```

## Process

1. Check staged files, commit only staged files if any exist
2. Analyze diff for multiple logical changes
3. Suggest splitting if needed
4. Create commit with emoji conventional format
5. Husky handles pre-commit hooks automatically

## Commit Format

`<type>: <description>`

**Types:**

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `perf`: Performance
- `test`: Tests
- `chore`: Build/tools

**Rules:**

- Imperative mood ("add" not "added")
- First line <72 chars
- Atomic commits (single purpose)
- Split unrelated changes

## Split Criteria

Different concerns | Mixed types | File patterns | Large changes

## Options

`--no-verify`: Skip Husky hooks

## Notes

- Husky handles pre-commit checks
- Only commit staged files if any exist
- Analyze diff for splitting suggestions
- **NEVER add Claude signature to commits**