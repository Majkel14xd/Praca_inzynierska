function updateResponse() {
  $.ajax({
    url: "/water_sensor_data/",
    type: "GET",
    dataType: "json",
    success: function (data) {
      $("#get_water_sensor_data").html(data.get_water_sensor_data);
    },
    complete: function () {
      setTimeout(updateResponse, 5000);
    },
  });
}

$(document).ready(function () {
  updateResponse();
});
