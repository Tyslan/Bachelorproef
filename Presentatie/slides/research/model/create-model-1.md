##  Model opstellen

- Modelleren naar de query's
- Users ophalen volgens username of email:

```SQL
CREATE TABLE users_by_username (
username text PRIMARY KEY,
email text,
birthday timestamp
);

CREATE TABLE users_by_email (
email text PRIMARY KEY,
username text,
birthday timestamp
);
```

note:
- 1 partitie read
- data verspreid
