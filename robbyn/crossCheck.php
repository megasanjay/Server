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
  //echo json_encode($infoArray);
  //return;

  foreach($infoArray as $arrayObject)
  {
    $arrayObject = json_decode($arrayObject);
    $id = $arrayObject->recordNum;
    $tblUsername = $arrayObject->recordUsername;
    $recordDate = $arrayObject->recordDate;
    $patientName = $arrayObject->patientName;
    $patientAge = $arrayObject->patientAge;
    $patientHeight = $arrayObject->patientHeight;
    $patientWeight = $arrayObject->patientWeight;

    // Prepare the sql restrictions
    $stmt = $conn->prepare("SELECT * FROM crosscheck WHERE username = ? AND recordnum = ?");

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
      //echo 'yes?f?';
      //return;

      $stmt = $conn->prepare("UPDATE crosscheck SET recordDate = ?, patientName = ?, patientAge = ?, patientHeight = ?, patientWeight = ? WHERE username = ? AND recordnum = ?");

      if ($stmt==FALSE)
      {
      	echo "There is a problem with prepare <br>";
      	echo $conn->error;
        return;
      }
      $stmt->bind_param("ssiddsi", $recordDate, $patientName, $patientAge, $patientHeight, $patientWeight, $tblUsername, $id);
      $stmt->execute(); // Run query

    }
    else
    {
      $timestamp = date("Y-m-d H:i:s");
      $stmt = $conn->prepare("INSERT INTO crosscheck (recordnum, username, recordDate, patientName, patientAge, patientHeight, patientWeight, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

      //echo 'yes?';
      //return;

      if ($stmt==FALSE)
      {
      	echo "There is a problem with prepare <br>";
      	echo $conn->error;
        return;
      }
      $stmt->bind_param("isssidds", $id, $tblUsername, $recordDate, $patientName, $patientAge, $patientHeight, $patientWeight, $timestamp);
      //$stmt->execute(); // Run query
      $result = $stmt->execute();
    //  if (!$result) {
        //  echo $result->error45;
        //  return;
    //  }
    }
  }

  $conn->close();
}
else
{
  echo "Error 2";
}

?>
