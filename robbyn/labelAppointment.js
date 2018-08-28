var user, startPos;
var tempGoal, goalStatus;

function checkPrivilege() {
  user = sessionStorage.getItem("currentUser");

  tempGoal = sessionStorage.getItem("tempGoal");

  // Checks if user is logged in
  if (user == undefined) {
    alert("Please log into your account.");
    window.open("Login.html", "_self", false); // Goes back to the login page
  }

  startPos = sessionStorage.getItem("lastApptViewed");

  if (startPos == undefined) {
    startPos = 1;
  }

  if (sessionStorage.getItem("labelApptTimerStatus") == "timerComplete" || sessionStorage.getItem("labelApptTimerStatus") == undefined) {
    sessionStorage.setItem("labelApptTimer", Date.now());
    sessionStorage.setItem("labelApptTimerStatus", "timerStarted");
  }

  if (sessionStorage.getItem("day") == 1) {
    setInterval(checkForRefresh, 2000);
  }

  checkRestrictions();
  loadData();
}

function checkForRefresh() {
  var requestURL = "http://52.39.225.46/robbyn/Tester.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = function () {
    try {
      if (httpRequest.readyState === XMLHttpRequest.DONE) {
        if (httpRequest.status === 200) {
          var response = httpRequest.responseText;
          if (response == 1) {
            var xrequestURL = "http://52.39.225.46/robbyn/Tester.php";
            xhttpRequest = new XMLHttpRequest();
            xhttpRequest.onreadystatechange = function () {
              if (xhttpRequest.readyState === XMLHttpRequest.DONE) {
                if (xhttpRequest.status === 200) {
                  var response = xhttpRequest.responseText;
                  if (response == "confirmed") {
                    sessionStorage.setItem("reloadConfirmed", "true");
                    sessionStorage.setItem("financialTimerStatus", "timerComplete");
                    sessionStorage.setItem("memoTimerStatus", "timerComplete");
                    sessionStorage.setItem("crossCheckTimerStatus", "timerComplete");
                    sessionStorage.setItem("sortFilesTimerStatus", "timerComplete");
                    sessionStorage.setItem("calculatePercentageTimerStatus", "timerComplete");
                    sessionStorage.setItem("labelApptTimerStatus", "timerComplete");
                    window.open("TestingHomepage.html", "_self", false);
                  }
                }
              }
            };
            xhttpRequest.open('POST', xrequestURL);
            xhttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttpRequest.send('userName=' + encodeURIComponent(user) + '&action=' + encodeURIComponent('confirmReload'));
          }
        }
      }
    } catch (e) {
      alert('Caught Exception: checkForRefresh' + e.description);
    }
  };
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('userName=' + encodeURIComponent(user) + '&action=' + encodeURIComponent('checkForReload'));
}

function checkRestrictions() {
  var labelApptGoal = sessionStorage.getItem("labelApptGoal");
  var limitArray = sessionStorage.getItem("limitors");
  limitArray = JSON.parse(limitArray);

  if (sessionStorage.getItem("currentStatus") == "dayOneTesting") {
    goalStatus = "dayOneGoals";
    return;
  } else {
    goalStatus = "restricted";
  }

  for (let i = 0; i < limitArray.length; i++) {
    if (limitArray[i].limiter == 6 && limitArray[i].status == "notMet") {
      goalStatus = "limiterGoals";
      break;
    }
    if (limitArray[i].limited == 6 && limitArray[i].status == "Met") {
      goalStatus = "limitedGoals";
      break;
    }
    if (limitArray[i].limited == 6 && limitArray[i].status == "fullMet") {
      goalStatus = "fullyMet";
      break;
    }
  }
}

function loadData() {
  document.getElementById("labelValue").selectedIndex = 0;

  position = sessionStorage.getItem("lastApptViewed");

  if (position == undefined) {
    position = 1;
    sessionStorage.setItem("lastApptViewed", position);
    startPos = position;
    sessionStorage.setItem("labelApptGoal", tempGoal);
  }

  checkForCompletion(position);
  requestData(position);
}

function checkForCompletion(position) {
  var goal = sessionStorage.getItem("labelApptGoal");

  if (goalStatus == "dayOneGoals") {
    return;
  }

  if (sessionStorage.getItem("day") == 1) {
    setInterval(checkForRefresh, 2000);
  }

  if (parseInt(position) > parseInt(goal)) {

    sessionStorage.setItem("labelApptGoal", parseInt(goal) + parseInt(tempGoal));
    sessionStorage.setItem("currentStatus", "goalMet");

    if (goalStatus == "limitedGoals") {
      let limitArray = sessionStorage.getItem("limitors");
      limitArray = JSON.parse(limitArray);

      for (let i = 0; i < limitArray.length; i++) {
        if (limitArray[i].limited == 6) {
          limitArray[i].status = "notMet";
        }
      }
      limitArray = JSON.stringify(limitArray);
      sessionStorage.setItem("limitors", limitArray);
      window.open("TestingHomepage.html", "_self", false);
    }

    if (goalStatus == "fullyMet") { return; }

    if (goalStatus == "limiterGoals") {
      let limitArray = sessionStorage.getItem("limitors");
      limitArray = JSON.parse(limitArray);

      for (let i = 0; i < limitArray.length; i++) {
        if (limitArray[i].limiter == 6 && limitArray[i].status == "notMet") {
          limitArray[i].status = "Met";
        }
      }
      limitArray = JSON.stringify(limitArray);
      sessionStorage.setItem("limitors", limitArray);
      if (sessionStorage.getItem("labelApptStatus") != "unrestricted"){
        alert("Goal Complete");
        sessionStorage.setItem("labelApptStatus", "unrestricted");
      }
    }
    else {
      if (sessionStorage.getItem("unlimitedlabelApptStatus") != "unrestricted"){
        alert("Goal Complete!");
        sessionStorage.setItem("unlimitedlabelApptStatus", "unrestricted");
      }
    }
  }
  submitGoalTime();
}

function submitGoalTime() {
  if (sessionStorage.getItem("labelApptTimerStatus") == "timerStarted") {
    var seconds = (Date.now() - sessionStorage.getItem("labelApptTimer")) / 1000;
    var goal = tempGoal;
    sessionStorage.setItem("labelApptTimerStatus", "timerComplete");

    var requestURL = "http://52.39.225.46/robbyn/goals.php";
    httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', requestURL);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    httpRequest.send('userName=' + encodeURIComponent(user) + '&time=' + encodeURIComponent(seconds) + '&type=' + encodeURIComponent("labelAppointments") + '&goal=' + encodeURIComponent(goal));
  }
  return;
}

function requestData(position) {
  var requestURL = "http://52.39.225.46/robbyn/labelAppointment.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = displayData;
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('action=' + encodeURIComponent('request') + '&position=' + encodeURIComponent(position));
}

function submitData() {
  position = sessionStorage.getItem("lastApptViewed");
  content = document.getElementById("labelValue").value;

  if (content == 'ns') {
    alert("Please select an option for the appointment");
    return;
  }

  runSaveAnimation();

  temp = new Object();
  temp.position = position;
  temp.username = user;
  temp.selected = content;
  sendData(temp);
}

function sendData(temp) {
  var requestURL = "http://52.39.225.46/robbyn/labelAppointment.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = confirmSave;
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('action=' + encodeURIComponent('submit') + '&content=' + JSON.stringify(temp));
}

function moveAppointment(direction) {
  position = sessionStorage.getItem("lastApptViewed");
  var requestURL = "http://52.39.225.46/robbyn/labelAppointment.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = confirmMove;
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  if (direction == 'prev') {
    position--;
    httpRequest.send('action=' + encodeURIComponent('move') + '&position=' + encodeURIComponent(position));
  } else {
    position++;
    httpRequest.send('action=' + encodeURIComponent('move') + '&position=' + encodeURIComponent(position));
  }
}

function displayData() {
  try {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        var response = httpRequest.responseText;

        if (response == "No Data") {
          alert("End of data");
          window.open("TestingHomepage.html", "_self", false);
          return;
        }

        response = JSON.parse(response);
        document.getElementById("idLabel").value = response.id;
        document.getElementById("firstNameLabel").value = response.firstname;
        document.getElementById("lastNameLabel").value = response.lastname;
        document.getElementById("apptNumLabel").value = response.apptnum;
      } else {
        alert('There was a problem with request.');
      }
    }
    return 1;
  } catch (e) // Always deal with what can happen badly, client-server applications --> there is always something that can go wrong on one end of the connection
  {
    alert('Caught Exception: displayData -' + e.description);
  }
}

function confirmMove() {
  try {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        var response = httpRequest.responseText;
        if (response == 'Rejected') {
          alert("This action is not possible at this time.");
          return;
        } else {
          sessionStorage.setItem("lastApptViewed", response);
          requestData(response);
        }
      } else {
        alert('There was a problem with said request.');
      }
    }
    return 1;
  } catch (e) // Always deal with what can happen badly, client-server applications --> there is always something that can go wrong on one end of the connection
  {
    alert('Caught Exception: confirmMove-' + e.description);
  }
}

function confirmSave() {
  try {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        var response = httpRequest.responseText;
        if (response == 'Success') {
          alert("Appointment saved");
          position = sessionStorage.getItem("lastApptViewed");
          sessionStorage.setItem("lastApptViewed", parseInt(position) + 1);
          loadData();
        } else {
          alert("Something went wrong. Please try again in a few seconds");
        }
      } else {
        alert(httpRequest.status);
        alert('There was a problem with the save.');
      }
    }
    return 1;
  } catch (e) // Always deal with what can happen badly, client-server applications --> there is always something that can go wrong on one end of the connection
  {
    alert('Caught Exception: confirmSave-' + e.description);
  }
}

function runSaveAnimation() {
  var wedge = document.getElementById("refreshing");

  wedge.classList.remove("hidden");
  wedge.classList.add("shown");

  setTimeout(function () {
    var wedge = document.getElementById("refreshing");

    wedge.classList.remove("shown");
    wedge.classList.add("hidden");
  }, 600);
}
