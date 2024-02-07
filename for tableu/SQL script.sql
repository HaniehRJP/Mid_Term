use midterm;

select *
from output
limit 5;

select geo_krs, avg(baserent) as baserent, count(geo_krs), avg(livingspace)
from output
group by geo_krs
having avg(livingspace)>50 and avg(livingspace)<70;
order by baserent;

select geo_krs, avg(baserent)
from
	(select geo_krs, livingspace, baserent
	from output
	where livingspace>50 and livingspace<60) as t1
group by geo_krs
order by avg(baserent);

select norooms, count(norooms), round(avg(baserent))
from output
group by norooms
order by count(norooms) desc;

select petsallowed, avg(baserent), avg(livingspace), round(avg(baserent)/avg(livingspace)) as price_per_meter
from output
where geo_krs='Berlin'
group by petsallowed
order by petsallowed;

select geo_krs, petsallowed, count(petsallowed), count(petsallowed)*100/sum(count(petsallowed)) over (partition by geo_krs)
from output
where geo_krs='M?nchen' or geo_krs='Berlin' or geo_krs='K?ln' or geo_krs='Leipzig' or geo_krs='Dresden'
group by geo_krs, petsallowed
order by geo_krs, petsallowed;

select haskitchen, avg(baserent), avg(livingspace), count(haskitchen)
from output
where geo_krs='Berlin'
group by haskitchen;

select geo_krs, haskitchen, avg(baserent)
from
(select haskitchen, baserent, geo_krs
from output
where livingspace>50 and livingspace<60) as t1
where geo_krs='Berlin'
group by haskitchen;

select petsallowed, avg(baserent)
from
(select petsallowed, baserent, geo_krs
from output
where livingspace>80 and livingspace<90) as t1
where geo_krs='Berlin'
group by petsallowed;