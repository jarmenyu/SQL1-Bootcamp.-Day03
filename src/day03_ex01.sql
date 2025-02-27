select m.id as menu_id
from menu as m
left join person_order as po on po.menu_id = m.id
where po.menu_id is NULL;