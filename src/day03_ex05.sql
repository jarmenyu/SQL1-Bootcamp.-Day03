select distinct pi.name as pizzeria_name
from person as p 
inner join person_visits as pv on p.id = pv.person_id
inner join pizzeria as pi on pv.pizzeria_id = pi.id
left join menu as m on pi.id = m.pizzeria_id
left join person_order as po on p.id = po.person_id and m.id = po.menu_id
where po.menu_id is NULL and p.name = 'Andrey';