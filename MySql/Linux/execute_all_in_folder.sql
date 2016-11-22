for sql_file in `ls ./*.sql`; do mysql -u -p -h DATABASE < $sql_file ; done
