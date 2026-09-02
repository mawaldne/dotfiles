# Instructions for the agent

## Tools

- Always use ripgrep for searches
- Always use jira-cli to pull jira
- Always use acli to read confluences docs

## Git & version control
- Never commit work or push to GitHub unless I explicitly ask. I always want to
  review work before you complete it.
- Leave changes staged for me — I will always review before anything is committed.
- When writing PR descriptions, do NOT hard-wrap prose. Use one line per
  paragraph and one line per bullet (let it soft-wrap). I squash-merge, and
  GitHub uses the PR description verbatim as the merge commit body, so any
  manual line breaks show up as awkward mid-sentence breaks in the commit on
  main. Only wrap the local git commit body if commitlint requires it (that
  body is replaced by the PR description on squash-merge anyway).
