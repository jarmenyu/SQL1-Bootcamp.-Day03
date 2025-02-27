select m1.pizza_name as pizza_name,
        pi1.name as pizzeria_name_1,
        pi2.name as pizzeria_name_2,
        m1.price
from menu as m1
inner join menu as m2 on
    m1.pizza_name = m2.pizza_name
    and m1.price = m2.price
    and m1.pizzeria_id < m2.pizzeria_id
inner join pizzeria as pi1 on m1.pizzeria_id = pi1.id
inner join pizzeria as pi2 on m2.pizzeria_id = pi2.id
order by pizza_name;