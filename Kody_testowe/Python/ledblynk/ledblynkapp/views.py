from django.shortcuts import render
import requests
from django.views.decorators.csrf import csrf_exempt
from .models import SensorData
from datetime import datetime

BLYNK_AUTH_TOKEN = "dHMzciEDFsYlqbQ63fQpR-pmPFhQOYz4"


@csrf_exempt
def index(request):
    context = {}
    if request.method == "POST":
        led1_state = request.POST.get("led1_state")
        led2_state = request.POST.get("led2_state")

        if led1_state == "on":
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V0=1"
            )
        else:
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V0=0"
            )

        if led2_state == "on":
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V1=1"
            )
        else:
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V1=0"
            )
    return render(request, "index.html", context)


def save_pin_state(request):
    context = {}
    if request.method == "GET":
        try:
            api_url = "https://blynk.cloud/external/api/get?token=dHMzciEDFsYlqbQ63fQpR-pmPFhQOYz4&V0"
            response = requests.get(api_url)
            data = response.json()

            value = data
            timestamp = datetime.now()

            # Zapisz stan pinu w bazie danych
            pin_state = SensorData.objects.create(
                pin="V0", value=value, timestamp=timestamp
            )

            if pin_state:
                context["message"] = "Dane zapisane poprawnie."
            else:
                context["error_message"] = "Błąd podczas zapisywania danych."
        except (requests.RequestException, KeyError, Exception) as e:
            context[
                "error_message"
            ] = f"Błąd podczas pobierania lub zapisywania danych: {str(e)}"

    return render(request, "index.html", context)
