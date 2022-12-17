<?php
// enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// get form data for student-cwid and sanitize it
$studentCWID = filter_var($_POST['student-cwid'], FILTER_SANITIZE_NUMBER_INT);

// get the database credentials from the environment variables
$host = 'mariadb';
$username = 'cs332f11';
$password = 'SVzK0gwZ';
$database = 'cs332f11';

echo "Student CWID: " . $studentCWID . "<br>";

// connect to the database
$conn = mysqli_connect($host, $username, $password, $database);

// check connection
if (!$conn) { die("Connection failed: " . mysqli_connect_error()); }

// read the SQL query from a file
$query = file_get_contents('../sql/get_courses_by_student.sql');

// prepare the statement
$stmt = $conn->prepare($query);

// bind the parameters
$stmt->bind_param("i", $studentCWID);

// execute the query
$stmt->execute();

// bind results to variables
$stmt->bind_result($number, $title, $grade);

// output the results
while ($stmt->fetch()) {
    printf("%s - %s (%s)\n\n", $number, $title, $grade);
    echo "<br>";
}

// close the connection
mysqli_close($conn);
?>
