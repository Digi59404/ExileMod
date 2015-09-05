/* =================== DELETES =================== */

/* DELETE Dead Players */
DELETE from player
WHERE is_alive = 0;

/* DELETE Bugged Players */
DELETE FROM player 
WHERE is_alive = 1 
and damage = 1;

DELETE FROM player 
WHERE account_uid = 'SomethingWentWrong'
OR account_uid = '';

/* DELETE old Players */
DELETE FROM player
WHERE LastUpdated < NOW() - INTERVAL 14 DAY;

/* DELETE old accounts */
DELETE FROM account
WHERE last_connect_at < NOW() - INTERVAL 30 DAY;

/* DELETE old Vehicles */
DELETE FROM vehicle
WHERE LastUpdated < NOW() - INTERVAL 7 DAY;

/* DELETE old Containers */
DELETE FROM container
WHERE last_accessed < NOW() - INTERVAL 14 DAY;

/* =================== UDPATES =================== */
