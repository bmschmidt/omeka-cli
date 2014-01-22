#!/bin/bash

email=$1
table_prefix="omeka_"
username=$(echo $email | sed "s/@.*//g"); 


egrep "=|\[database\]" db.ini | egrep "database|host|username|password|dbname" | sed 's/\[database\]/\[mysql\]/;s/username/user/g;s/dbname/database/' > my.cnf

mysql --defaults-file=my.cnf -e  "INSERT INTO ${table_prefix}users (username,name,email,active,role) VALUES ('$username','','$email',1,'contributor');"
