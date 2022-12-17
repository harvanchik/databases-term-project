SELECT grade,
       COUNT(*) AS num_students 
  FROM enrollment
  WHERE course_number = ?
    AND section_number = ?
  GROUP BY grade;
