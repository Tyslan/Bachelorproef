##  Restricties - Clusteringkolommen

```
CREATE TABLE NumberOfTwitterMessages (
userid bigint, date text, hour int, minute int, nrOfTweets int,
PRIMARY KEY ()(userid, date), hour, minute)
);
```

- Restrictie op date enkel indien restrictie op userid
- '<', '<=', '>', '>='
  - Enkel op laatste kolom met restrictie
- Multi-column slice

```SQL
SELECT * FROM NumberOfTwitterMessages
WHERE userid = 2222
  AND date = '2016−04−25'
  AND (hour, minute ) >= (12, 30)
  AND (hour, minute ) <= (14, 0)
;
```

note:
Enkel restrictie op clusteringkolom als die ervoor ook een restrictie heeft
