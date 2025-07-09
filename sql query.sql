CREATE DATABASE sql_project;
USE  sql_project;

-- Create Table
DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales
     (  transactions_id	INT PRIMARY KEY,
     sale_date DATE,
     sale_time	TIME,
     customer_id INT,	
     gender	VARCHAR(15),
     age INT,
     category VARCHAR(15),
     quantiy INT,
     price_per_unit	FLOAT,
     cogs FLOAT,
     total_sale FLOAT
     );
     
     select * from retail_sales;
     
     ## Data cleaning
        
        select * from retail_sales
         where 
         quantiy is null
         or
         sale_date is null
         or
         sale_time is null
         or
         customer_id is null
         or
         gender is null
         or
         category is null
         or 
         quantiy is null
         or
         cogs is null
         or
         total_sale is null;
         
         # How many sales we have?
         Select count(*) as total_sale from retail_sales;
         
         # How many unique customrs we have?
         
         Select count(distinct customer_id)  from retail_sales;
         
         # How many unique category we have?
         
         Select distinct category from retail_sales;
         
	   ## Data Analysis & Business Key Problems & Answers
        -- My analysis and Finding.
        
	-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
    
        Select * from retail_sales
        where sale_date ='2022-11-05';
        
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
         
         Select 
         category,sum(quantiy)
         from retail_sales
         where category='clothing'
         and 
         quantiy>=4
         group by category order by sum(quantiy) asc limit 10;
         
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
 Select distinct category,sum(total_sale) as Net_sale,
 count(*) as total_order 
 from retail_sales
 group by 1;
 
 -- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
 
  Select Round(avg(age),2) as avg_age from retail_sales
  where category='Beauty';

 -- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
 
    Select * from retail_sales
    where total_sale>1000;
    
    -- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
    
     Select
     category, gender,count(*) as total_trans
     from retail_sales
     group by category,gender order by 1;
    
    -- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
        
        Select month(sale_date),
       round( avg(total_sale),2) as average_sale
        from retail_sales
        group by 1 order by 2 desc;
        
    
    -- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
    
   Select customer_id,sum(total_sale) as total_sales from retail_sales
   group by 1 order by 2 desc limit 5;
    
    
    -- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
    
    Select count(distinct customer_id) as distinct_customers , category
from retail_sales 
group by category ; 
    
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

  Select *, 
  case 
  when Extract(hour from sale_time)<12 then 'Morning'
  when Extract(hour from sale_time) between 12 and 17 then 'Afternoon'
  else 'evening'
  End as shift from retail_sales;
  
  # End of  Project