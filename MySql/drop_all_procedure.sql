SET @procs = NULL;
SET @database = database();

SELECT GROUP_CONCAT(' DROP PROCEDURE ', ROUTINE_SCHEMA, '.', ROUTINE_NAME  SEPARATOR ';') INTO @procs
FROM information_schema.ROUTINES R
WHERE R.ROUTINE_TYPE = "PROCEDURE"
AND R.ROUTINE_SCHEMA = @database;

SET @procs = IFNULL(CONCAT(@procs, ';'), 'SELECT "No Procs"');
SELECT @procs;
