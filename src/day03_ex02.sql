select m.pizza_name as pizza_name, m.price as price, pi.name as pizzeria_name
from menu as m
inner join pizzeria as pi on pi.id = m.pizzeria_id
left join person_order as po on po.menu_id = m.id
where po.menu_id is NULL
order by pizza_name asc, price asc;