SELECT concat('ALTER DATABASE ', a.SCHEMA_NAME ,' CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;') 
FROM information_schema.SCHEMATA a
WHERE a.DEFAULT_COLLATION_NAME != 'utf8mb4_general_ci';

SELECT DISTINCT concat('ALTER TABLE ', a.TABLE_SCHEMA , '.', a.TABLE_NAME, ' CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;')
FROM information_schema.`COLUMNS` a
WHERE a.COLLATION_NAME != 'utf8mb4_general_ci';
