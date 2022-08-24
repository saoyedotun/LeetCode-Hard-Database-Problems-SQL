-- MySQL, Oracle PL/SQL, MSSQL
SELECT Student.student_id, student_name
FROM Exam
JOIN Student
    ON Exam.student_id = Student.student_id
GROUP BY student_id
HAVING SUM(CASE WHEN (exam_id, score) IN
(SELECT exam_id, MIN(score) AS score
FROM Exam
GROUP BY exam_id
UNION
SELECT exam_id, MAX(score) AS score
FROM Exam
GROUP BY exam_id) THEN 1 ELSE 0 END) = 0
ORDER BY student_id


SELECT Student.student_id, student_name
FROM Exam
JOIN Student
    ON Exam.student_id = Student.student_id
GROUP BY student_id
HAVING SUM((exam_id, score) IN
(SELECT exam_id, MIN(score) AS score
FROM Exam
GROUP BY exam_id
UNION
SELECT exam_id, MAX(score) AS score
FROM Exam
GROUP BY exam_id)) = 0
ORDER BY student_id