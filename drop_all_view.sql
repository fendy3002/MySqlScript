SET @views = NULL;
SET @database_name = database();

SELECT GROUP_CONCAT(table_schema, '.', table_name) INTO @views
FROM information_schema.views
WHERE table_schema = @database_name;

SET @views = IFNULL(CONCAT('DROP VIEW ', @views), 'SELECT "No Views"');
PREPARE stmt FROM @views;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
