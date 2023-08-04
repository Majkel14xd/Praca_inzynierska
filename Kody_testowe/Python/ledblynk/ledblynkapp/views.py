from django.shortcuts import render
import requests
from django.views.decorators.csrf import csrf_exempt
BLYNK_AUTH_TOKEN = "dHMzciEDFsYlqbQ63fQpR-pmPFhQOYz4"


@csrf_exempt
def index(request):
    context = {}
    if request.method == 'POST':
        led1_state = request.POST.get('led1_state')
        led2_state = request.POST.get('led2_state')

        if led1_state == 'on':
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V0=1")
        else:
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V0=0")

        if led2_state == 'on':
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V1=1")
        else:
            requests.get(
                f"https://blynk.cloud/external/api/update?token={BLYNK_AUTH_TOKEN}&V1=0")
    return render(request, 'index.html', context)
