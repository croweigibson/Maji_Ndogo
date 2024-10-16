-- adding employee email
SELECT
    REPLACE(employee_name, ' ', '.') AS new_employee_name,
    CONCAT(
        LOWER(REPLACE(employee_name, ' ', '.')), '@ndogowater.gov'
    ) AS new_email
FROM employee
LIMIT 10;

-- updating email column
UPDATE employee
SET email = CONCAT(LOWER(REPLACE(employee_name, ' ', '.')),
'@ndogowater.gov');

-- cleaning the phone number column
SELECT
    LENGTH(phone_number) as old_length,
    TRIM(phone_number) as new_phone_number,
    LENGTH(TRIM(phone_number)) as new_length
FROM
    employee
LIMIT 10;

-- updating phone numbers
UPDATE employee
SET phone_number = TRIM(phone_number);