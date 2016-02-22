#!/bin/bash
rm web.db
sqlite3 web.db < thread.sql
chmod 766 web.db
