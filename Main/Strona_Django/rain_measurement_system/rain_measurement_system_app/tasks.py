import requests


def water_sensor_data_api():
    response = requests.get(
        "https://blynk.cloud/external/api/get?token=vnEDWHA3KRFwm91ji5MNPcojZgo1NfOT&V4"
    )
    if response.status_code == 200:
        data = response.json()
        return data
