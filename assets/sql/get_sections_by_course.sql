SELECT sec.section_number, 
       sec.classroom, 
       sec.meeting_days, 
       sec.begin_time, 
       sec.end_time, 
       COUNT(en.student_cwid) AS enrollments 
    FROM section sec
    LEFT JOIN enrollment en 
           ON sec.course_number = en.course_number 
          AND  sec.section_number = en.section_number
    WHERE sec.course_number = ?
    GROUP BY sec.section_number;
