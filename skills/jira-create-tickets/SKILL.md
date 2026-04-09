---
name: jira-create-ticket
description: Create a Jira ticket using the 3 C's format (Card, Context, Confirmation)
argument-hint: [ticket title]
allowed-tools: Bash(jira *)
---

Create a Jira ticket with the following format:

**Card (What):**
[Describe what needs to be done - the task or feature]

**Context (Why):**
[Explain why this is important - the business/technical context]

**Confirmation (Done):**
[Define what "done" looks like - acceptance criteria]

Use this information to create a Jira ticket with title: $ARGUMENTS

The ticket should be assigned to $(jira me) and the description should follow the 3 C's format above.

If you don't know how to use the jira cli, read the docs at https://github.com/ankitpokhrel/jira-cli

Execute: `echo "**Card (What):**
[Describe what needs to be done]

**Context (Why):**
[Explain why this is important]

**Confirmation (Done):**
[Define acceptance criteria]" | jira issue create -tStory -s"$ARGUMENTS" -a$(jira me) --no-input --template -`
