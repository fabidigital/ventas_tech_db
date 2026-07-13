--Consulta 1-- Resumen ejecutivo mensual- Total facturado, cantidad de pedidos y ticket promedio

select sum(quantity*unit_price) As total_facturado from sales;
select sum(quantity) As cantidad_de_pedido from sales;
select avg(unit_price) As ticket_promedio from sales;
select 
        FORMAT(order_date, 'yyyy-MM') AS mes
        FROM sales;

 --Consulta 2 -- Ranking de Productos-Unidades vendidas-top 5 
    
select  
       top 5 product_id, sum(quantity*unit_price) as total_facturado
       From sales
       group by product_id
       order by total_facturado desc;
       
--Consulta 3 cliente recurrentes que realizaron más de un pedido. Uso de Group B y Customer_id 
--Having Count(*)>1.

Select*From sales; 
Select 
        customer_id, Count(order_id) As total_pedidos 
From sales
Group By customer_id
Having Count(order_id) >1;

--Consulta 4 -Consulta Meses promedio de total facturado con etiqueta adicional
--/por encima/por debajo del promedio.Uso Case When

SELECT 
    FORMAT(order_date, 'yyyy-MM') AS mes, AVG(total_amount) As Promedio_general,
    SUM(quantity * total_amount) AS total_facturado,
    CASE 
        WHEN SUM(quantity * total_amount) > AVG(total_amount)
        THEN 'Por encima'
        ELSE 'Por debajo' End As comparación_promedio
        FROM sales
        GROUP BY FORMAT(order_date, 'yyyy-MM');

 --Se determina que el total facturado durante el 2024 es de $ 6609,00, con un ticket promedio 
 --de $379,60. En el top 5 el producto mas vendido codigo 301 Laptop pro 15 con un total facturado
 --de $3600,00. Durante el mes de Enero/24 se ha facturado por encima del promedio anual.