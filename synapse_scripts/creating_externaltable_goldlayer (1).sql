
--- scoped credential

 CREATE DATABASE SCOPED CREDENTIAL yash_cred
WITH IDENTITY = 'Managed Identity';





--creating datasource for silerlayer

 CREATE EXTERNAL DATA SOURCE source_gold
 WITH (LOCATION = 'https://stadwgen.blob.core.windows.net/silver',
 CREDENTIAL = yash_cred)


--datasource for goldlayer


 CREATE EXTERNAL DATA SOURCE source_gold
 WITH (LOCATION = 'https://stadwgen.blob.core.windows.net/gold',
 CREDENTIAL = yash_cred)


 --creating fileformat

 CREATE EXTERNAL FILE FORMAT format_parquet WITH (
 FORMAT_TYPE = PARQUET,
DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)

---creating external table for sales


 CREATE EXTERNAL TABLE gold.extsales 
 WITH (
        LOCATION='extsales',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.sales


------creating external table for calender

 CREATE EXTERNAL TABLE gold.calender 
 WITH (
        LOCATION='calender',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.calenderdata

----creating external table for customers

 CREATE EXTERNAL TABLE gold.customer 
 WITH (
        LOCATION='customer',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.customers



---creating external table productssubcategories

 CREATE EXTERNAL TABLE gold.productssubcat 
 WITH (
        LOCATION='prodsubcat',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.productssubcategories

--creating external table returns

 CREATE EXTERNAL TABLE gold.returnsdata
 WITH (
        LOCATION='returns',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.returns

--creating external table territories

 CREATE EXTERNAL TABLE gold.territorie
 WITH (
        LOCATION='territories',
        DATA_SOURCE=source_gold,
        FILE_FORMAT=format_parquet
        ) AS
        select * from gold.territories






