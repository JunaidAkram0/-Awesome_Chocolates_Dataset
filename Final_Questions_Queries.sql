select * from sales;
select * from People;
select * from products;
select * from Geo;
Select * from sales
where Amount > '1000' and Boxes < '100';
Select s.SPID, s.SaleDate,p.salesperson, Count(*) as 'Number of sales'
from sales s
join people p on p.SPID = s.SPID
where SaleDate >= '2022-01-01' and SaleDate <= '2022-01-30'

group by s.SPID,s.SaleDate,p.salesperson
order by SPID;

Select pr.product, Sum(s.Boxes) as 'Total Boxes'
from sales s
Join products pr on s.PID = pr.PID
where pr.Product in ('Milk Bars' , 'Eclairs')
and s.SaleDate >= '2022-02-01' 
and s.SaleDate <= '2022-02-07'
group by pr.product 
Order by sum(s.boxes) desc;

SELECT 
    s.*,
    CASE 
        WHEN DAYOFWEEK(s.SaleDate) = 3 THEN 'Wednesday'
        ELSE 'Not Wednesday'
    END AS DayOfWeek
FROM sales s
WHERE s.Customers < 100
  AND s.Boxes < 100;
select * from sales;
select * from People;
select * from products;
select * from Geo;

select p.salesperson  from sales s
Join People p on s.SPID = p.SPID
where s.SaleDate >= '2022-01-01' 
	and s.SaleDate <= '2022-01-07'  
Group by p.salesperson 
order by salesperson;

select p.salesperson  from sales s
Join People p on s.SPID = p.SPID
where s.SaleDate >= '2022-01-01' 
	and s.SaleDate <= '2022-01-07' 
    and Amount = 0
Group by p.salesperson 
order by salesperson;

Select SaleDate, sum(s.boxes) as 'Total Boxes' from sales s
where s.Boxes > '1000'
group by s.saledate
order by s.saledate;

SELECT 
    MONTH(s.SaleDate) AS 'Month', year(s.SaleDate) as 'Year',
    SUM(CASE WHEN s.Boxes > '1000' THEN '1 'ELSE '0' END) AS 'Number of Sales Above 1000'
FROM sales s
WHERE s.Boxes > 1000  
Group by Year(s.saledate), MONTH(s.SaleDate)  
Order by Year(s.saledate), MONTH(s.SaleDate);

select * from GEo;
Select * from products;
select * from sales;
select * from People;

select pr.Product,ge.Geo, s.SaleDate
from sales s
join geo ge on s.GeoID = ge.GeoID
join products pr on pr.PID = s.PID
where ge.Geo = 'New Zealand' and pr.product = 'After Nines'
order by s.SaleDate;

select * from GEo;
Select * from products;
select * from sales;
select * from People;

select
	year(s.saleDate) as 'year', 
	month(s.SaleDate) as 'Month',
    sum(s.boxes) as 'Total boxes', ge.GEO as 'Country'
from sales s
	join geo ge on ge.GeoID = s.GeoID
  
    where ge.Geo in ('India', 'New Zealand')
    group by ge.GEO, month(s.SaleDate) , year(s.saleDate)

    

