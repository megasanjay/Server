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

  startPos = sessionStorage.getItem("lastMemoViewed");

  if (startPos == undefined) {
    startPos = 1;
  }

  if (sessionStorage.getItem("memoTimerStatus") == "timerComplete" || sessionStorage.getItem("memoTimerStatus") == undefined) {
    sessionStorage.setItem("memoTimer", Date.now());
    sessionStorage.setItem("memoTimerStatus", "timerStarted");
  }

  if (sessionStorage.getItem("day") == 1) {
    setInterval(checkForRefresh, 2000);
  }

  checkRestrictions();
  setInterval(submitChanges, 5000);
  loadMemo();
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
        } else {
          alert('There was a problem with request.');
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
  var memoGoal = sessionStorage.getItem("memoGoal");
  var limitArray = sessionStorage.getItem("limitors");
  limitArray = JSON.parse(limitArray);

  if (sessionStorage.getItem("currentStatus") == "dayOneTesting") {
    goalStatus = "dayOneGoals";
    return;
  } else {
    goalStatus = "restricted";
  }

  for (let i = 0; i < limitArray.length; i++) {
    if (limitArray[i].limiter == 2 && limitArray[i].status == "notMet") {
      goalStatus = "limiterGoals";
      break;
    }
    if (limitArray[i].limited == 2 && limitArray[i].status == "Met") {
      goalStatus = "limitedGoals";
      break;
    }
    if (limitArray[i].limited == 2 && limitArray[i].status == "fullMet") {
      goalStatus = "fullyMet";
      break;
    }
  }
}

function loadMemo() {
  position = sessionStorage.getItem("lastMemoViewed");
  goalState = sessionStorage.getItem("memoGoal");

  if (position == undefined) {
    position = 1;
    sessionStorage.setItem("lastMemoViewed", position);
    startPos = position;
    sessionStorage.setItem("memoGoal", tempGoal);
  }

  if (sessionStorage.getItem("day") == 1) {
    setInterval(checkForRefresh, 2000);
  }

  checkForCompletion(position);
  requestMemo(position);
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
                    console.log("confirmed");
                    window.open("TestingHomepage.html", "_self", false);
                  }
                }
              }
            };
            xhttpRequest.open('POST', requestURL);
            xhttpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhttpRequest.send('userName=' + encodeURIComponent(user) + '&action=' + encodeURIComponent('confirmReload'));
          }
        } else {
          alert('There was a problem with request.');
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

function checkForCompletion(position) {
  var goal = sessionStorage.getItem("memoGoal");

  if (goalStatus == "dayOneGoals") {
    return;
  }

  if (parseInt(position) > parseInt(goal)) {
    sessionStorage.setItem("memoGoal", parseInt(goal) + parseInt(tempGoal));
    sessionStorage.setItem("currentStatus", "goalMet");

    if (goalStatus == "limitedGoals") {
      let limitArray = sessionStorage.getItem("limitors");
      limitArray = JSON.parse(limitArray);

      for (let i = 0; i < limitArray.length; i++) {
        if (limitArray[i].limited == 2) {
          limitArray[i].status = "notMet";
        }
      }
      limitArray = JSON.stringify(limitArray);
      sessionStorage.setItem("limitors", limitArray);
      window.open("TestingHomepage.html", "_self", false);
    }

    if (goalStatus == "fullyMet") {return;}

    if (goalStatus == "limiterGoals") {
      let limitArray = sessionStorage.getItem("limitors");
      limitArray = JSON.parse(limitArray);

      for (let i = 0; i < limitArray.length; i++) {
        if (limitArray[i].limiter == 2 && limitArray[i].status == "notMet") {
          limitArray[i].status = "Met";
        }
      }
      limitArray = JSON.stringify(limitArray);
      sessionStorage.setItem("limitors", limitArray);
      if (sessionStorage.getItem("memoStatus") != "unrestricted"){
        alert("Goal Complete");
        sessionStorage.setItem("memoStatus", "unrestricted");
      }
    }
    else {
      if (sessionStorage.getItem("unlimitedmemoStatus") != "unrestricted"){
        alert("Goal Complete");
        sessionStorage.setItem("unlimitedmemoStatus", "unrestricted");
      }
    }
  }
  submitGoalTime();
}

function submitGoalTime() {
  if (sessionStorage.getItem("memoTimerStatus") == "timerStarted") {
    var seconds = (Date.now() - sessionStorage.getItem("memoTimer")) / 1000;
    var goal = tempGoal;
    sessionStorage.setItem("memoTimerStatus", "timerComplete");

    var requestURL = "http://52.39.225.46/robbyn/goals.php";
    httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', requestURL);
    httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    httpRequest.send('userName=' + encodeURIComponent(user) + '&time=' + encodeURIComponent(seconds) + '&type=' + encodeURIComponent("memos") + '&goal=' + encodeURIComponent(goal));
  }
  return;
}

function requestMemo(position) {
  var requestURL = "http://52.39.225.46/robbyn/editMemo.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = displayMemo;
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('action=' + encodeURIComponent('request') + '&position=' + encodeURIComponent(position));
}

function submitMemo() {
  runSaveAnimation();
  position = sessionStorage.getItem("lastMemoViewed");
  content = document.getElementById("editTextBox").value;
  sendMemo(position, content);
}

function submitChanges() {
  position = sessionStorage.getItem("lastMemoViewed");
  content = document.getElementById("editTextBox").value;
  var requestURL = "http://52.39.225.46/robbyn/editMemo.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('action=' + encodeURIComponent('submit') + '&username=' + encodeURIComponent(user) + '&position=' + encodeURIComponent(position) + '&memo=' + encodeURIComponent(content));
}

function sendMemo(position, content) {
  var requestURL = "http://52.39.225.46/robbyn/editMemo.php";
  httpRequest = new XMLHttpRequest();
  httpRequest.onreadystatechange = confirmSave;
  httpRequest.open('POST', requestURL);
  httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  httpRequest.send('action=' + encodeURIComponent('submit') + '&username=' + encodeURIComponent(user) + '&position=' + encodeURIComponent(position) + '&memo=' + encodeURIComponent(content));
}

function displayMemo() {
  try {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        var response = httpRequest.responseText;
        if (response == "")
        {
          alert("End of Data");
          return;
        }
        console.log(response);
        document.getElementById("editTextBox").value = response;
      } else {
        alert('There was a problem with the request.');
      }
    }
    return 1;
  } catch (e) {
    alert('Caught Exception: ' + e.description);
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

function confirmSave() {
  try {
    if (httpRequest.readyState === XMLHttpRequest.DONE) {
      if (httpRequest.status === 200) {
        var response = httpRequest.responseText;
        if (response == 'Success') {
          alert("Memo edits saved");
          position = sessionStorage.getItem("lastMemoViewed");
          sessionStorage.setItem("lastMemoViewed", parseInt(position) + 1);
          loadMemo();
        } else {
          alert("Something went wrong. Please try again in a few seconds");
        }
      } else {
        alert('There was a problem with the request.');
      }
    }
    return 1;
  } catch (e)
  {
    alert('Caught Exception: ' + e.description);
  }
}
