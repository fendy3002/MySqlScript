SET group_concat_max_len = 1024 * 1024 * 100;
SELECT CONCAT('SELECT * FROM (',GROUP_CONCAT(CONCAT('SELECT ',QUOTE(tb),' Tables_in_database,
COUNT(1) "Number of Rows" FROM ',db,'.',tb) SEPARATOR ' UNION '),') A;')
INTO @sql FROM (SELECT table_schema db,table_name tb
FROM information_schema.tables WHERE table_schema = DATABASE()) A;
PREPARE s FROM @sql; EXECUTE s; DEALLOCATE PREPARE s;

-- http://dba.stackexchange.com/questions/75451/show-table-name-number-of-records-for-each-table-in-a-mysql-innodb-database
