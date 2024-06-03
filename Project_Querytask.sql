select * from Lapi_spec

select * from company	

select * from customer
	

---task1:inner join

	select * from customer as c
inner join Lapi_spec as ls
on c.Ls_id = ls.Ls_id
inner join company as Ca
on ls.Ls_id = Ca.Ls_id
	
-----task 2 - join table useing where clause
-----Problem Statement: create a table by useing Where clause of customer and lapi_spec table 
	--for lapi_model= 'Dell Inspiron'
select * from customer as c
inner join lapi_spec as ls
on c.Ls_id = ls.Ls_id
where lapi_model = 'Dell Inspiron'

----task 3- 'exicute having, group by, order by together'
---probelm statement-show 'lapi_model' along with the 'lapi_types' whose capacity is more than 90 kwh
select lapi_model,lapi_types, battery_capacity_kwh from Lapi_spec
group by lapi_model,lapi_types, battery_capacity_kwh
having battery_capacity_kwh > 90 
order by lapi_model
---you can check the result on data output table below
	
	
---task4 - join table and excute 'having' and 'group by' function together
----problem statement:show lapi_manufacture_country who launched brand HP in the year 2024 	
select lapi_manufacture_country,brand, com.lapi_model , brand from company as Com
inner join lapi_spec As Ls
	on com.ls_id = Ls.ls_id
	group by lapi_manufacture_country,brand,com.lapi_model ,model_year
	having model_year = 2024 and brand = 'HP'
-----you can see the output on below data output table
	

----task5: join ,having,group by
----Problem Statement: Create Table by useing join for lapi_types,battery_capacity_kwh, brand on group by
--company and lapi_spec table having brand = 'HP'
select lapi_types,battery_capacity_kwh, brand from company as Co
inner join Lapi_spec as ls
on Co.ls_id = ls.ls_id
group by lapi_types, battery_capacity_kwh, brand 
having brand = 'HP'
	

---task -6: Execute having, group by order by together
----Problem Statement: show ssd_gb,hhd_gb,ram_gb along with price_$ whose price range is greater than 900$
select ssd_gb,hhd_gb,ram_gb,price_$ from lapi_spec  
group by ssd_gb,hhd_gb,ram_gb,price_$
having price_$ > 900
	order by ram_gb
	

---task 7: Window function(RANK)
---Problem statement: Give rank to distinct 'lapi_type' whos Price range between 500$ to 1500$
select lapi_types, price_$,RANK()
over (Partition by lapi_types
	order by price_$ DESC ) from lapi_spec
where price_$ BETWEEN 500 AND 1000
-----scroll down the output table to see the result
	

----task8:Window function(ROW_Number)
----Problem Statement: Calculate no. of Rows distinct 'lapi_types'
	select lapi_types, Row_number()
over(
	partition by lapi_types	
  )
from lapi_spec

	
----task9: window function(Dence_rank)
----Problem statement : Give Dence_RANK to distinct 'lapi_types' whose range in between 500$ to !000$
select lapi_types, price_$, DENSE_RANK()
over(partition by lapi_types
	order by price_$ DESC ) from lapi_spec
where price_$ Between 500 AND 1000
-----scroll down the data output table to see the query result

	
----task10: SUBQUERY
----Problem Statement : create table to given details about the customer who bought lapi in between year 2021 and 2024
select * From customer where ls_id
 	In( Select ls_id from lapi_spec where model_year between 2021 and 2024
	and Price_$ > 400
	)
order by city

------subqurey with clause
select * from lapi_spec where ls_id in (select Distinct ls_id from Lapi_spec where Price_$ > 1000)

select * from lapi_spec

----subquery with  clause
----Problem Statement: Given the rows where lapy_types =laptop or Mobile Workstation
select * from customer as c
inner join ( select * from lapi_spec where lapi_types = 'Laptop' or lapi_types = 'Mobile Workstation') as Ls
on c.ls_id =Ls.ls_id
---you can see the Result below on Data output table

select * from company
	
----subquery (Order by)
----Problem Statemnt: show the table for order by using select from company and lapi_spec table

select com_id,lapi_manufacture_country ,(select brand from lapi_spec as Ls where Ca.ls_id = ls.ls_id)
from company as Ca
order by com_id
------you can see the result on data output table below

----task11: create new query table using select key
	
create table Num_spec as select ssd_gb, hhd_gb, ram_gb from lapi_spec
select * from Num_spec



------------------------------------------------------------------------------------------------------------------------
select distinct lapi_model from lapi_spec
select count (distinct lapi_model) from lapi_spec
select count(lapi_model) from lapi_spec group by lapi_model having count(lapi_model) = 2




----------------------------------------------------------------------------------------------------------------------------

select distinct lapi_model from lapi_spec
select count (distinct lapi_model) from lapi_spec
select lapi_model,count(lapi_model) from lapi_spec group by lapi_model




