WITH male_visits AS (
    SELECT pi.name AS pizzeria_name
    FROM person_order AS pv
    INNER JOIN person AS p ON p.id = pv.person_id
    INNER JOIN menu AS m ON m.id = pv.menu_id
    INNER JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
    WHERE p.gender = 'male'
    
    EXCEPT

    SELECT pi.name AS pizzeria_name
    FROM person_order AS pv
    INNER JOIN person AS p ON p.id = pv.person_id
    INNER JOIN menu AS m ON m.id = pv.menu_id
    INNER JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
    WHERE p.gender = 'female'
),
female_visits AS (
    SELECT pi.name AS pizzeria_name
    FROM person_order AS pv
    INNER JOIN person AS p ON p.id = pv.person_id
    INNER JOIN menu AS m ON m.id = pv.menu_id
    INNER JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
    WHERE p.gender = 'female'
    
    EXCEPT

    SELECT pi.name AS pizzeria_name
    FROM person_order AS pv
    INNER JOIN person AS p ON p.id = pv.person_id
    INNER JOIN menu AS m ON m.id = pv.menu_id
    INNER JOIN pizzeria AS pi ON pi.id = m.pizzeria_id
    WHERE p.gender = 'male'
)

SELECT pizzeria_name
FROM male_visits
UNION
SELECT pizzeria_name
FROM female_visits
ORDER BY pizzeria_name;
