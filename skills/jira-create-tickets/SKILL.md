---
name: jira-create-ticket
description: Create and manage Jira tickets using jira-cli (create issues, add to sprints, assign, transition)
argument-hint: [ticket title or issue key]
allowed-tools: Bash(jira *)
---

# Jira CLI

## Prerequisites

- Binary: `/opt/homebrew/bin/jira` (invoke as `jira`, not `jira-cli`)
- Config: `/Users/waldnmx/.config/.jira/.config.yml`
- Project: **DL**, Board: **1806**

## Creating Issues

### Default format: 3 C's (Card, Context, Confirmation)

Structure ticket descriptions using:

- **Card (What):** What needs to be done
- **Context (Why):** Business/technical motivation
- **Confirmation (Done):** Acceptance criteria

### Create command

```bash
# Pipe body via --template - flag
echo "<description body>" | jira issue create \
  -p DL \
  -t <Type> \
  -s "<summary>" \
  -a "$(jira me)" \
  --no-input \
  --template -
```

**Issue types:** Epic, Story, Bug, Task, Sub-task, Story-Bug, Support, Spike

**Flags:**
| Flag | Description |
|------|-------------|
| `-p DL` | Project key |
| `-t Bug` | Issue type |
| `-s "title"` | Summary/title |
| `-a "$(jira me)"` | Assign to current user |
| `-l label1,label2` | Labels (comma-separated) |
| `-P <priority>` | Priority (Highest, High, Medium, Low, Lowest) |
| `--no-input` | Skip interactive prompts |
| `--template -` | Read description from stdin |

### Examples

```bash
# Bug
echo "**Card:** Fix duplicate records in consumer_preference_choice table
**Context:** ON CONFLICT (id) allows duplicates when same consumer+preference combo gets a new UUID
**Confirmation:** Unique constraint on (consumer_id, consumer_preference_id, consumer_preference_group_id) prevents duplicates" \
| jira issue create -p DL -t Bug -s "Fix duplicate consumer preference choice records" -a "$(jira me)" --no-input --template -

# Story
echo "**Card:** Add bulk consent endpoint
**Context:** Mobile team needs to set multiple preferences in one call
**Confirmation:** POST /bulk-consent accepts array of preferences and returns updated state" \
| jira issue create -p DL -t Story -s "Add bulk consent endpoint" -a "$(jira me)" --no-input --template -
```

## Sprints

```bash
# List active and future sprints
jira sprint list -p DL --state active,future --table --plain --columns ID,NAME,STATE

# Add issue to sprint
jira sprint add <SPRINT_ID> <ISSUE-KEY>
```

## Other Useful Commands

```bash
# Current user
jira me

# View issue
jira issue view <ISSUE-KEY>

# List issues assigned to me
jira issue list -a "$(jira me)" --plain --columns KEY,SUMMARY,STATUS

# Transition/move issue
jira issue move <ISSUE-KEY> "<status>"

# Add comment
jira issue comment add <ISSUE-KEY> -b "comment body"
```

## Workflow

1. **Get sprint ID** (if adding to sprint): `jira sprint list -p DL --state active,future --table --plain --columns ID,NAME,STATE`
2. **Create issue**: Use the create command with appropriate type and description
3. **Add to sprint** (if needed): `jira sprint add <SPRINT_ID> <ISSUE-KEY>`
4. **Confirm**: `jira issue view <ISSUE-KEY>`

## Important Notes

- Always use `--no-input` to avoid interactive prompts
- Always use `--template -` and pipe the body via stdin for descriptions
- Use `$(jira me)` to get the current user for assignment
- If `jira issue create` fails with "invalid issue types", the config may need regeneration: `jira init --force`
