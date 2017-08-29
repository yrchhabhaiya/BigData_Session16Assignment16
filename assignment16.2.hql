USE default;
CREATE TABLE users
(
id INT,
name STRING,
skills ARRAY<STRING>
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY ':';

LOAD DATA LOCAL INPATH '/home/acadgild/dataset/assignment16/users.txt'
INTO TABLE users;
SELECT * FROM users;

ADD JAR /home/acadgild/dataset/assignment16/hiveudf.jar;
CREATE TEMPORARY FUNCTION concat_ws AS 'hive.SEPArray';

SELECT id, name, concat_ws("SEP",skills) as result from users;
