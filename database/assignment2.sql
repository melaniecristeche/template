-- 6 queries assignment2

-- 1

INSERT INTO account (account_firstname, account_lastname, 
					account_email, account_password) 
					VALUES(
'Tony', 'Stark', 'tony@starkent.com', 'Im1ronM@n');

-- 2 

UPDATE account
SET account_type = 'Admin' 
WHERE account_id = 1;

-- 3

DELETE FROM account 
WHERE account_id = 1;

-- 4

UPDATE inventory
SET inv_description = REPLACE(inv_description, 'small interiors', 
							 'a huge interior')
							 WHERE inv_make = 'GM' AND inv_model = 'Hummer';

-- 5

SELECT inventory.inv_make, inventory.inv_model, 
classification.classification_name

FROM inventory

INNER JOIN classification ON inventory.classification_id = classification.classification_id
WHERE classification.classification_name = 'Sport';

-- 6

UPDATE inventory
SET inv_image = CONCAT(SUBSTRING(inv_image FROM 1 FOR POSITION('/' IN inv_image) + 1),
					  'vehicles/', SUBSTRING(inv_image FROM POSITION('/' IN inv_image) + 1)),
					  inv_thumbnail = CONCAT(SUBSTRING(inv_thumbnail FROM 1 FOR POSITION('/' 
				IN inv_thumbnail) + 1), 'vehicles/', SUBSTRING(inv_thumbnail FROM POSITION
												('/' IN inv_thumbnail) + 1));

