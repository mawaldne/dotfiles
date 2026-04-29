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
    "AskUserQuestion"
  ]
---

## Context

- Current git status: !`git status`
- Current git diff (staged and unstaged changes): !`git diff HEAD`
- Current branch: !`git branch --show-current`
- Recent commits: !`git log --oneline -10`

# Claude Command: Commit

Creates well-formatted commits with conventional commit messages.

## Usage

```
/commit
/commit --no-verify
```

## Process

1. Check staged files, commit only staged files if any exist
2. Analyze diff for multiple logical changes
3. Suggest splitting if needed
4. Determine the **scope** from the diff (service, package, or repo component). If not obvious, use AskUserQuestion to ask the user.
5. If the user has not provided a jira reference, use AskUserQuestion to get it.
6. Create commit with the structured format (title + body)
7. Husky handles pre-commit hooks automatically

## Commit Format

**Title:**

`type(scope): description. JIRA-NNN`

**Body (always included):**

```
## Description

A few sentences describing overall goals of the commit's changes.

JIRA ticket:
https://adl-technology.atlassian.net/browse/JIRA-NNN

## Test plans

1. Step-by-step plan to test the changes
2. ...
```

**Example commit message:**

```
feat(database): add unique constraint on consumer_id + preference_id. DL-1476

## Description

Prevent duplicate choice rows by adding a unique constraint and updating
the upsert conflict key. Includes a data migration to clean up existing
duplicates.

JIRA ticket:
https://adl-technology.atlassian.net/browse/DL-1476

## Test plans

1. Run integration tests for consumer-preference-choice repository
2. Verify no duplicate rows exist after migration
```

## Types

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation
- `style`: Formatting
- `refactor`: Code restructuring
- `perf`: Performance
- `test`: Tests
- `chore`: Build/tools

## Scope

Scope is **always required** in the title. It is the name of a service, package, or repo component.

Examples: `database`, `rest`, `consumer-preferences`, `terms-conditions`

Derive from the diff when possible (e.g., if all changes are in `packages/database/`, scope is `database`). If changes span multiple packages, use the primary one or a higher-level name.

## JIRA Reference

Examples: `DL-1234`, `PAY-0000`, `DP-292`

Always appended after a period at the end of the title line.

## Rules

- Title format: `type(scope): description. JIRA-NNN`
- Scope is always required
- Body always includes `## Description`, `JIRA ticket:` link, and `## Test plans`
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