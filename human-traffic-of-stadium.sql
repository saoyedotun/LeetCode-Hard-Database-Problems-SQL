-- MySQL
SELECT DISTINCT camp_nou.*
FROM Stadium camp_nou
JOIN Stadium santiago_bernabeu
JOIN Stadium wanda_metropolitano
ON (camp_nou.id = santiago_bernabeu.id - 1 AND camp_nou.id = wanda_metropolitano.id - 2) OR
(camp_nou.id = santiago_bernabeu.id + 1 AND camp_nou.id = wanda_metropolitano.id - 1) OR
(camp_nou.id = santiago_bernabeu.id + 1 AND camp_nou.id = wanda_metropolitano.id + 2)
WHERE
    camp_nou.people >= 100 AND
    santiago_bernabeu.people >= 100 AND
    wanda_metropolitano.people >= 100
ORDER BY visit_date