<?php
// enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// get form data for professor-ssn and sanitize it
$professorSSN = filter_var($_POST['professor-ssn'], FILTER_SANITIZE_NUMBER_INT);

// get the database credentials from the environment variables
$host = 'mariadb';
$username = 'cs332f11';
$password = 'SVzK0gwZ';
$database = 'cs332f11';

echo "Professor SSN: " . $professorSSN . "<br>";

// connect to the database
$conn = mysqli_connect($host, $username, $password, $database);

// check connection
if (!$conn) { die("Connection failed: " . mysqli_connect_error()); }

// read the SQL query from a file
$query = file_get_contents('../sql/get_sections_by_professor.sql');

// prepare the statement
$stmt = $conn->prepare($query);

// bind the parameters
$stmt->bind_param("i", $professorSSN);

// execute the query
$stmt->execute();

// bind results to variables
$stmt->bind_result($title, $classroom, $meetingDays, $beginTime, $endTime);

// output the results
while ($stmt->fetch()) { 
    printf("%s - %s - %s - %s - %s", $title, $classroom, $meetingDays, $beginTime, $endTime);
    echo "<br>";
}

// close the connection
mysqli_close($conn);
?>
