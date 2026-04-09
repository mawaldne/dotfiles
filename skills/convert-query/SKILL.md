---
name: convert-query
description: Convert SQL queries between Postgres and Snowflake
---

Our production postgres data is available via Snowflake. So we often need
to convert queries to/from Snowflake depending on the environment we are in.
We can fairly consistent conventions so we can easily convert queries


## Column names
* Postgres: camelCase, due to the casing the name must be surrounded by double quotes, e.g. "consumerId"
* Snowflake: UPPERCASE, no quotes, no underscores e.g. "CONSUMERID"

## Table names
* Postgres: snake_case, e.g. consumer_history
* Snowflake: UPPER_CASE with underscores, e.g. CONSUMER_HISTORY

## SQL flavor
* Both datastores have slightly different syntax and function support.
* For example, Postgres' STRING_AGG is similar to Snowflakes LIST_AGG
* Use your knowledge to convert syntax
