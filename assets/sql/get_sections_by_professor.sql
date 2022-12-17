SELECT co.title,
       sec.classroom,
       sec.meeting_days,
       sec.begin_time,
       sec.end_time
    FROM section sec
    INNER JOIN course co
            ON sec.course_number = co.number
    WHERE sec.professor = ?;
