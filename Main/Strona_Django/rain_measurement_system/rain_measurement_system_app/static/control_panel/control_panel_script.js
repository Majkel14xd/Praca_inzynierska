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

const gaugeElement = document.querySelector(".gauge");

function setGaugeValue(gauge, value) {
  if (value < 0 || value > 1) {
    return;
  }

  gauge.querySelector(".gauge__fill").style.transform = `rotate(${
    value / 2
  }turn)`;
  gauge.querySelector(".gauge__cover").textContent = `${Math.round(
    value * 100
  )}%`;
}

setGaugeValue(gaugeElement, 1);
