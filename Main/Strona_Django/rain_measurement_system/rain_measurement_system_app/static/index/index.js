function toggleLeftMenu() {
  var leftMenu = document.getElementById("left_menu");
  if (leftMenu.style.left === "0px" || leftMenu.style.left === "") {
    leftMenu.style.left = "-15%";
  } else {
    leftMenu.style.left = "0px";
  }
}
