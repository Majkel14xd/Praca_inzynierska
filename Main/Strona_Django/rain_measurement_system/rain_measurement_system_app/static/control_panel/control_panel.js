function profileload() {
  var content = document.getElementById("content");
  var page = new XMLHttpRequest();
  page.open("GET", "/profile/", true);
  page.onreadystatechange = function () {
    if (page.readyState === 4 && page.status === 200) {
      content.innerHTML = page.responseText;
    }
  };
  page.send();
}

function resetpasswordload() {
  var content = document.getElementById("content");
  var page = new XMLHttpRequest();
  page.open("GET", "/change_password/", true);
  page.onreadystatechange = function () {
    if (page.readyState === 4 && page.status === 200) {
      content.innerHTML = page.responseText;
    }
  };
  page.send();
}

function loadlogs() {
  var content = document.getElementById("content");
  var page = new XMLHttpRequest();
  page.open("GET", "/logs/", true);
  page.onreadystatechange = function () {
    if (page.readyState === 4 && page.status === 200) {
      content.innerHTML = page.responseText;
    }
  };
  page.send();
}
