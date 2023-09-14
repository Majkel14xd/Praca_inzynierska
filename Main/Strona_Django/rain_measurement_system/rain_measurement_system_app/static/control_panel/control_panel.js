function profileload() {
  var subpageContainer = document.getElementById("content");
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/profile/", true);
  xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
      subpageContainer.innerHTML = xhr.responseText;
    }
  };
  xhr.send();
}
