--CREATING A RELATION BY LOADING USER DATA FILE
users = LOAD '/user/maria_dev/pig/book.user' 
USING PigStorage(',') 
AS (isbn:chararray, title:chararray, author:chararray, pub_year:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE users INTO 'hbase://users' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('info:title info:author info:pub_year');
