use amz_flipkart_price_compare;


create table amazon
(uniq_id INT,
product_name varchar(255), 	
pid	varchar(255),
retail_price INT,
discounted_price INT,	
is_FK_Advantage_product varchar(255),
product_rating varchar(255),
overall_rating	varchar(255),
brand varchar(255)
);

alter table amazon
rename column product_name to product_name_in_amazon;

alter table amazon
rename column retail_price to retail_price_in_amazon;

alter table amazon
rename column discounted_price to discounted_price_in_amazon;

LOAD DATA LOCAL INFILE 'D:\\Intershala Questions\\Shack labs\\amz_com-ecommerce_sample.csv'
INTO TABLE amazon FIELDS TERMINATED BY ','
ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

select * from amazon limit 50;


create table flipkart
(uniq_id INT,
product_name varchar(255), 	
pid	varchar(255),
retail_price varchar(255),
discounted_price INT,	
is_FK_Advantage_product varchar(255),
product_rating varchar(255),
overall_rating	varchar(255),
brand varchar(255)
);

alter table flipkart
rename column product_name to product_name_in_flipkart;

alter table flipkart
rename column retail_price to retail_price_in_flipkart;

alter table flipkart
rename column discounted_price to discounted_price_in_flipkart;


select * from flipkart limit 50;

select product_name_in_flipkart, retail_price_in_flipkart, discounted_price_in_flipkart, product_name_in_amazon,
		retail_price_in_amazon, discounted_price_in_amazon
	from amazon a inner join flipkart f on a.pid=f.pid;
    







