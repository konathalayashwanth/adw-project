
--create view calender

create view gold.calender
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/calender/',
            FORMAT='PARQUET'
         )
         AS QUERY0;

----create view customers


create view gold.customers
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/customers/',
            FORMAT='PARQUET'
         )
         AS QUERY1;





----create view products


create view gold.products
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/products/',
            FORMAT='PARQUET'
         )
         AS QUERY2;



---create view productssubcategories


create view gold.productssubcategories
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/productssubcategories/',
            FORMAT='PARQUET'
         )
         AS QUERY3;


---create view returns


create view gold.returns
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/returns/',
            FORMAT='PARQUET'
         )
         AS QUERY4;

---create view sales


create view gold.sales
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/sales/',
            FORMAT='PARQUET'
         )
         AS QUERY5;



---create view territories


create view gold.territories
AS 
select *
         from OPENROWSET
         ( 
            BULK 'https://stadwgen.blob.core.windows.net/silver/territories/',
            FORMAT='PARQUET'
         )
         AS QUERY6;






















