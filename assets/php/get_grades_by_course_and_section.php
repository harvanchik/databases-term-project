<?php
// enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// get form data for course-number and section-number and sanitize it
$courseNum = filter_var($_POST['course-number'], FILTER_SANITIZE_NUMBER_INT);
$sectionNum = filter_var($_POST['section-number'], FILTER_SANITIZE_NUMBER_INT);

// get the database credentials from the environment variables
$host = 'mariadb';
$username = 'cs332f11';
$password = 'SVzK0gwZ';
$database = 'cs332f11';

echo "Course Number: " . $courseNum . "<br>";
echo "Section Number: " . $sectionNum . "<br>";

// connect to the database
$conn = mysqli_connect($host, $username, $password, $database);

// check connection
if (!$conn) { die("Connection failed: " . mysqli_connect_error()); }

// read the SQL query from a file
$query = file_get_contents('../sql/get_grades_by_course_and_section.sql');

// prepare the statement
$stmt = $conn->prepare($query);

// bind the parameters
$stmt->bind_param("ii", $courseNum, $sectionNum);

// execute the query
$stmt->execute();

// bind results to variables
$stmt->bind_result($grade, $numStudents);

// output the results
while ($stmt->fetch()) { 
    printf("%s (%s)\n\n", $grade, $numStudents);
    echo "<br>";
}

// close the connection
mysqli_close($conn);
?>
