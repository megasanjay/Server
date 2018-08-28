<?php
date_default_timezone_set('America/Los_Angeles');

$servername = 'localhost'; // default server name
$username = 'psychUser'; // user name that you created
$password = 'N20t54TjPQKEmVhl'; // password that you created
$dbname = 'psych';

if (!empty($_POST))
{
  $infoArray = $_POST['info'];

  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname);

  // Check connection
  if ($conn->connect_error)
  {
    die("Connection failed: " . $conn->connect_error ."<br>");
  }

  $infoArray = json_decode($infoArray);

  foreach($infoArray as $arrayObject)
  {
    $arrayObject = json_decode($arrayObject);
    $id = $arrayObject->recordNum;
    $tblUsername = $arrayObject->recordUsername;
    $recordApptAttend = $arrayObject->recordApptAttend;
    $recordApptLate = $arrayObject->recordApptLate;
    $recordApptNotAttend = $arrayObject->recordApptNotAttend;
    $recordPercentAttend = ($arrayObject->recordPercentAttend != '') ? $arrayObject->recordPercentAttend : NULL;
    $recordPercentLate = ($arrayObject->recordPercentLate != '') ? $arrayObject->recordPercentLate : NULL;

    // Prepare the sql restrictions
    $stmt = $conn->prepare("SELECT * FROM percentageinput WHERE username = ? AND recordnum = ?");

    if ($stmt == FALSE)
    {
      echo "There is a problem with prepare <br>";
      echo $conn->error; // Need to connect/reconnect before the prepare call otherwise it doesnt work
    }
    $stmt->bind_param("si", $tblUsername, $id);

    $stmt->execute();               // Run query
    $result = $stmt->get_result();  // query result

    if ($result->num_rows != 0)     // Results returned
    {
      $stmt = $conn->prepare("UPDATE percentageinput SET apptattend = ?, apptlate = ?, apptnotattend = ?, percentattend = ?, percentlate = ? WHERE username = ? AND recordnum = ?");

      if ($stmt==FALSE)
      {
      	echo "There is a problem with prepare <br>";
      	echo $conn->error;
      }
      $stmt->bind_param("iiiddsi", $recordApptAttend, $recordApptLate, $recordApptNotAttend, $recordPercentAttend, $recordPercentLate, $tblUsername, $id);
      $stmt->execute();
    }
    else
    {
      $timestamp = date("Y-m-d H:i:s");
      $stmt = $conn->prepare("INSERT INTO percentageinput (recordnum, username, apptattend, apptlate, apptnotattend, percentattend, percentlate, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

      if ($stmt==FALSE)
      {
      	echo "There is a problem with prepare <br>";
      	echo $conn->error;
        return;
      }

      $stmt->bind_param("isiiidds", $id, $tblUsername, $recordApptAttend, $recordApptLate, $recordApptNotAttend, $recordPercentAttend, $recordPercentLate, $timestamp);


      $stmt->execute();
    }
  }

  $conn->close();
}
else
{
  echo "Error 2";
}

?>
