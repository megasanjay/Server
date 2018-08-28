<?php
date_default_timezone_set('America/Los_Angeles');

$servername = 'localhost'; // default server name
$serverusername = 'psychUser'; // user name that you created
$serverpassword = 'N20t54TjPQKEmVhl'; // password that you created
$dbname = 'psych';

if (!empty($_POST))
{
  $action = $_POST['action'];

  if ($action == 'submit')
  {
    $content = $_POST["content"];
    $content = json_decode($content);

    $username = $content->username;
    $filename = $content->filename;
    $selected = $content->selected;

    submitFile($username, $filename, $selected);
    return;
  }
}
else
{
  echo "No connection";
  return;
}

function submitFile($username, $filename, $selected)
{
  // Create connection
  $conn = new mysqli('localhost', 'psychUser', 'N20t54TjPQKEmVhl', 'psych');

  // Check connection
  if ($conn->connect_error)
  {
      die("Connection failed: " . $conn->connect_error ."<br>");
  }
  // Prepare sql statement
  $sql = "SELECT * FROM sortedfiles LIMIT 2";
  $result = $conn->query($sql);
  $timestamp = date("Y-m-d H:i:s");

  if ($result->num_rows == 0)
  {
     $stmt = $conn->prepare("INSERT INTO sortedfiles (recordnum, username, inputfile, selected, timestamp) VALUES (0,?,?,?,?)");
  }
  else
  {
     $stmt = $conn->prepare("INSERT INTO sortedfiles (username, inputfile, selected, timestamp) VALUES (?,?,?,?)");
  }

  if ($stmt==FALSE)
  {
    echo "There is a problem with prepare <br>";
    echo $conn->error; // Need to connect/reconnect before the prepare call otherwise it doesnt work
    return;
  }
  $stmt->bind_param("ssss", $username, $filename, $selected, $timestamp);
  if ($stmt->execute() == TRUE)
  {
    echo "Success";
    return;
  }
  else {
    echo "stmt execute error.";
  }
}
?>
