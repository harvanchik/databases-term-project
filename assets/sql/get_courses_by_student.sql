SELECT co.number,
       co.title,
       en.grade
    FROM enrollment en
    INNER JOIN course co
            ON en.course_number = co.number
    WHERE en.student_cwid = ?;
