select airline_name as linie_lotnicze, max(passengers_to_india) as maksymalna_liczba_pasazerow_do_indii
from airline_monthly_internat ami 
group by airline_name order by max(passengers_to_india) desc 

select carrier_type, count(carrier_type) as liczba_lotow 
from airline_monthly_internat ami 
group by carrier_type 
order by carrier_type desc 

select carrier_type, count(carrier_type) as liczba_lotow, "YEAR"  
from airline_monthly_internat ami 
group by carrier_type, "YEAR" 
order by "YEAR" asc 

select airline_name as linie_lotnicze, max(passengers_from_india) as maksymalna_liczba_pasazerow_z_indii
from airline_monthly_internat ami 
group by airline_name order by max(passengers_from_india) desc 

select airline_name as linie_lotnicze, max(freight_to_india) as maksymalna_liczba_towarow_do_indii
from airline_monthly_internat ami 
group by airline_name order by max(freight_to_india) desc 

select airline_name as linie_lotnicze, max(freight_from_india) as maksymalna_liczba_towarow_z_indii
from airline_monthly_internat ami 
group by airline_name order by max(freight_from_india) desc 

select "YEAR" as rok, max(freight_from_india) as maksymalna_liczba_towarow_z_indii
from airline_monthly_internat ami 
group by "YEAR"  order by max(freight_from_india) desc 

select "YEAR" as rok, max(passengers_to_india) as maksymalna_liczba_pasazerow_do_indii
from airline_monthly_internat ami 
group by "YEAR"  order by max(passengers_to_india) desc 

select "YEAR" as rok, max(passengers_from_india) as maksymalna_liczba_pasazerow_z_indii
from airline_monthly_internat ami 
group by "YEAR"  order by max(passengers_from_india) desc 

select airline_name as linie_lotnicze, sum(freight_from_india) as maksymalna_liczba_towarow_z_indii
from airline_monthly_internat ami 
group by airline_name order by sum(freight_from_india) desc 

select "YEAR", sum(freight_from_india) as maksymalna_liczba_towarow_z_indii
from airline_monthly_internat ami
group by "YEAR" 
order by sum(freight_from_india) desc 

select "YEAR", sum(freight_to_india) as maksymalna_liczba_towarow_do_indii
from airline_monthly_internat ami
group by "YEAR" 
order by sum(freight_to_india) desc 


select "YEAR", avg(freight_to_india) as srednia_liczba_towarow_do_indii
from airline_monthly_internat ami
group by "YEAR"  
order by avg(freight_to_india) desc 

select *
from airline_monthly_internat ami 



--Projekt Linie lotnicze

select carrier_type, count(distinct airline_name) as udzial_linii_lotniczych, "YEAR" as rok 
from airline_monthly_internat ami 
group by carrier_type, "YEAR" 
order by "YEAR" asc 

select distinct airline_name, "YEAR" as rok 
from airline_monthly_internat ami 
where carrier_type = 'DOMESTIC'
group by airline_name, "YEAR" 
order by "YEAR" asc 

select airline_name as linie_lotnicze, sum(freight_from_india) as pasazerowie_z_indii_suma
from airline_monthly_internat ami 
group by airline_name order by sum(freight_from_india) desc 
limit 5

select airline_name as linie_lotnicze, sum(freight_to_india) as pasazerowie_do_indii_suma
from airline_monthly_internat ami 
group by airline_name order by sum(freight_to_india) desc 
limit 5

select 
airline_name as linie_lotnicze, 
"YEAR" as rok, 
sum(freight_from_india) as towary_z_indii_suma, 
sum(freight_to_india) as towary_do_indii_suma,
freight_from_india+freight_to_india as total 
from airline_monthly_internat ami 
group by airline_name, "YEAR", freight_to_india, freight_from_india   
order by total  desc 

select 
airline_name  as linie_lotnicze, 
"YEAR" as rok, 
round(sum(freight_from_india)) as towary_z_indii_suma, 
round(sum(freight_to_india)) as towary_do_indii_suma,
round(freight_from_india+freight_to_india) as total 
ntile(5) over (order by od.unit_price *od.quantity *(1-od.discount) ) podzbiory
from airline_monthly_internat ami 
group by airline_name, "YEAR", freight_to_india, freight_from_india   

create view v_towary
select 
airline_name  as linie_lotnicze, 
"YEAR" as rok, 
round(sum(freight_from_india)) as towary_z_indii_suma, 
round(sum(freight_to_india)) as towary_do_indii_suma,
round(freight_from_india+freight_to_india) as total 
from airline_monthly_internat ami 
where "YEAR" = '2015'
group by airline_name, "YEAR", freight_to_india, freight_from_india 
order by total desc
limit 5

select airline_name as linie_lotnicze, sum(freight_from_india) as maksymalna_liczba_towarow_z_indii, "YEAR" 
from airline_monthly_internat ami 
where "YEAR" ='2015'
group by airline_name, "YEAR"  order by sum(freight_from_india) desc 
limit 5

select airline_name as linie_lotnicze, sum(freight_from_india) as maksymalna_liczba_towarow_z_indii, "YEAR" 
from airline_monthly_internat ami 
where "YEAR" ='2016'
group by airline_name, "YEAR"  order by sum(freight_from_india) desc 
limit 5

select airline_name as linie_lotnicze, sum(freight_from_india) as maksymalna_liczba_towarow_z_indii, "YEAR" 
from airline_monthly_internat ami 
where "YEAR" ='2017'
group by airline_name, "YEAR"  order by sum(freight_from_india) desc 
limit 5


create view v_linie_towary_2015 as 
select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2015'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

create view v_linie_towary_2016 as 
select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2016'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

create view v_linie_towary_2017 as 
select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2017'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

select *
from v_linie_towary_2015
union all
select *
from v_linie_towary_2016
union all 
select *
from v_linie_towary_2017


create view v_linie_pasazerowie_2015 as 
select airline_name as linie_lotnicze, 
round(sum(passengers_from_india)::numeric ,0) as suma_pasazerowe_z_indii, 
round(sum(passengers_to_india)::numeric ,0) as suma_pasazerow_do_indii,
round((sum(passengers_from_india)+sum(passengers_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2015'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

create view v_linie_pasazerowie_2016 as 
select airline_name as linie_lotnicze, 
round(sum(passengers_from_india)::numeric ,0) as suma_pasazerowe_z_indii, 
round(sum(passengers_to_india)::numeric ,0) as suma_pasazerow_do_indii,
round((sum(passengers_from_india)+sum(passengers_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2016'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

create view v_linie_pasazerowie_2017 as 
select airline_name as linie_lotnicze, 
round(sum(passengers_from_india)::numeric ,0) as suma_pasazerowe_z_indii, 
round(sum(passengers_to_india)::numeric ,0) as suma_pasazerow_do_indii,
round((sum(passengers_from_india)+sum(passengers_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2017'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

select *
from v_linie_pasazerowie_2015
union all
select *
from v_linie_pasazerowie_2016
union all 
select *
from v_linie_pasazerowie_2017



select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2015'
group by airline_name, "YEAR"   


create view v_linie_towary_2016 as 
select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2016'
group by airline_name, "YEAR"  order by 3 desc 
limit 5

create view v_linie_towary_2017 as 
select airline_name as linie_lotnicze, 
round(sum(freight_from_india)::numeric ,0) as suma_towarow_z_indii, 
round(sum(freight_to_india)::numeric ,0) as suma_towarow_do_indii,
round((sum(freight_from_india)+sum(freight_to_india))::numeric ,0) as total,
"YEAR" as rok
from airline_monthly_internat ami 
where "YEAR" ='2017'
group by airline_name, "YEAR"  order by 3 desc 
limit 5