#!/bin/bash
echo "enter table you wish to get rid of"
read tablename
sqlite3 web.db  "drop table $tablename;"
sqlite3 web.db  "delete from threads where name='${tablename//_/ }';"
