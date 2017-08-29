set hive.support.concurrency = true;
set hive.enforce.bucketing = true;
set hive.exec.dynamic.partition.mode = nonstrict;
set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
set hive.compactor.initiator.on = true;
set hive.compactor.worker.threads = 1;

CREATE TABLE college
(
clg_id INT,
clg_name STRING,
clg_loc STRING
) 
clustered by (clg_id) into 5 buckets
stored as orc 
TBLPROPERTIES('transactional'='true');

INSERT INTO table college values
(1,'nec','nlr'),
(2,'vit','vlr'),
(3,'srm','chen'),
(4,'lpu','del'),
(5,'stanford','uk'),
(6,'JNTUA','atp'),
(7,'cambridge','us');

select * from college;

INSERT INTO table college values
(8,'sit','ind');

UPDATE college set clg_name = 'iit' where clg_id = 8;

DELETE from college WHERE clg_id=8;

