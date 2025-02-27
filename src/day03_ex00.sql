select m.pizza_name as pizza_name, m.price as price, pi.name as pizzeria_name, v.visit_date as visit_date
from person_visits as v
inner join person as p on p.id = v.person_id
inner join pizzeria as pi on pi.id = v.pizzeria_id
inner join menu as m on m.pizzeria_id = pi.id
where p.name = 'Kate' and m.price between 800 and 1000
order by pizza_name asc, price asc, pizzeria_name asc;