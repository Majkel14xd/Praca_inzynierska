function scrolloautorze() {
  var div = document.getElementById("o_autorze");

  div.scrollIntoView({ behavior: "smooth" });
}

function scrollostronie() {
  var div = document.getElementById("o_stronie");

  div.scrollIntoView({ behavior: "smooth" });
}
function toggleMenu() {
  var topMenu = document.getElementById("top-menu");
  if (topMenu.style.display === "block") {
    topMenu.style.display = "none";
  } else {
    topMenu.style.display = "block";
    topMenu.scrollIntoView({ behavior: "smooth" });
  }
}
