WITH male_visits AS (
    SELECT pi.name AS pizzeria_name, COUNT(*) AS male_count
    FROM person_visits AS pv
    INNER JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
    INNER JOIN person AS p ON p.id = pv.person_id
    WHERE p.gender = 'male'
    GROUP BY pi.name
),
female_visits AS (
    SELECT pi.name AS pizzeria_name, COUNT(*) AS female_count
    FROM person_visits AS pv
    INNER JOIN pizzeria AS pi ON pi.id = pv.pizzeria_id
    INNER JOIN person AS p ON p.id = pv.person_id
    WHERE p.gender = 'female'
    GROUP BY pi.name
)
SELECT mv.pizzeria_name
FROM male_visits mv
LEFT JOIN female_visits fv ON mv.pizzeria_name = fv.pizzeria_name
WHERE mv.male_count > fv.female_count

UNION ALL

SELECT fv.pizzeria_name
FROM female_visits fv
LEFT JOIN male_visits mv ON fv.pizzeria_name = mv.pizzeria_name
WHERE fv.female_count > mv.male_count

ORDER BY pizzeria_name;
