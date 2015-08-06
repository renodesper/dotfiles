#!/bin/sh

# create a new PostgreSQL database cluster
postgresql-setup initdb

# allow password authentication
# replace "ident" with "md5" in /var/lib/pgsql/data/pg_hba.conf
sed -i 's/ ident/ md5/g' /var/lib/pgsql/data/pg_hba.conf

# auto start postgres service
chkconfig --levels 235 postgresql on