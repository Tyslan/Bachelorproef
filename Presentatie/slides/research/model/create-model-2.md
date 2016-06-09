##  Model opstellen - Foutief

- Users ophalen volgens username of email
- Redundante data verminderen

```SQL
CREATE TABLE users (
id uuid PRIMARY KEY,
username text,
email text,
birthday int
);

CREATE TABLE users_by_username (
username text PRIMARY KEY,
id uuid
);

CREATE TABLE users_by_email (
email text PRIMARY KEY,
id uuid
);
```

note:
- data verspreid
- 2 partitie reads
  - Join onmogelijk
  - 2 query's
- '<=' over part-kol met tokens
