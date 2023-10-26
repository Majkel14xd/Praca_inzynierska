from .forms import (
    LogsForm,
)
from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from .models import *
from .forms import *
from django.http import HttpResponse
from .tasks import *
from django.http import JsonResponse


def index(request):
    if request.user.is_authenticated:
        return redirect("control_panel")
    else:
        return render(request, "index/index.html")


def indexafterlogin(request):
    return render(request, "index/index.html")


def login(request):
    if request.user.is_authenticated:
        return redirect("control_panel")
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(
            request,
            username=username,
            password=password,
        )
        if user is not None:
            auth_login(request, user)
            request.session["welcome_message"] = f"Witaj {user.username}!"
            return redirect("control_panel")
        else:
            msg = "Błąd logowania, nieprawidłowy login lub hasło"
            form = AuthenticationForm(request.POST)
            return render(request, "login/login.html", {"form": form, "msg": msg})
    else:
        form = AuthenticationForm()
        return render(request, "login/login.html", {"form": form})


def control_panel(request):
    if not request.user.is_authenticated:
        return redirect("login")
    welcome_message = request.session.pop("welcome_message", None)
    context = {
        "welcome_message": welcome_message,
    }
    return render(request, "control_panel/control_panel.html", context)


def change_password(request):
    if not request.user.is_authenticated:
        return redirect("login")
    if request.method == "POST":
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, ("Hasło zostało zakutalizowane!"))
            return redirect("change_password")
        else:
            messages.error(request, ("Bład w aktualizowaniu hasła."))
    else:
        form = PasswordChangeForm(request.user)
    return render(request, "change_password/change_password.html", {"form": form})


def signout(request):
    logout(request)
    return redirect("index")


def profile(request):
    if not request.user.is_authenticated:
        return redirect("login")
    user = request.user
    username = user.username
    email = user.email
    first_name = user.first_name
    last_name = user.last_name
    date_joined = user.date_joined
    last_login = user.last_login
    id_num = user.id
    context = {
        'username': username,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'date_joined': date_joined,
        'last_login': last_login,
        'id_num': id_num,
    }
    return render(request, "profile/profile.html", context)


def logs(request):
    if not request.user.is_authenticated:
        return redirect("login")

    logs = None
    msg_data_empty = ""
    if request.method == "POST":
        form = LogsForm(request.POST)
        if form.is_valid():
            date_from = form.cleaned_data["date_from"]
            date_to = form.cleaned_data["date_to"]
            logs = Logs.objects.filter(
                data_zdarzenia__range=(date_from, date_to))
            if not logs:
                msg_data_empty = "Brak danych albo nie uzupełniona dobrze data szukania"
    else:
        form = LogsForm()
    context = {
        "form": form,
        "logs": logs,
        "msg_data_empty": msg_data_empty,
    }
    return render(request, "logs/logs.html", context)


def database_from_mysql(request):
    if not request.user.is_authenticated:
        return redirect("login")

    data = None
    message = ""
    if request.method == "POST":
        form = Datafrommuysqlform(request.POST)
        if form.is_valid():
            model = form.cleaned_data["model"]
            date_from = form.cleaned_data["date_from"]
            date_to = form.cleaned_data["date_to"]
            if model == "rain_gauge":
                data = RainGaugae.objects.filter(
                    data_odczytu__range=(date_from, date_to),
                )
            elif model == "rain_sensor":
                data = RainSensor.objects.filter(
                    data_odczytu__range=(date_from, date_to),
                )
            elif model == "water_sensor":
                data = WaterSensor.objects.filter(
                    data_odczytu__range=(date_from, date_to),
                )
            if not data:
                message = "Brak dostępnych danych w wybranym zakresie."

    else:
        form = Datafrommuysqlform()

    context = {
        "form": form,
        "data": data,
        "message": message,
    }

    return render(request, "database_from_mysql/database_from_mysql.html", context)


def device_info(request):
    if not request.user.is_authenticated:
        return redirect("login")
    latest_device_info = DeviceInfo.objects.latest('id')
    return render(request, "device_info/device_info.html", {'latest_device_info': latest_device_info})


def settings(request):
    if not request.user.is_authenticated:
        return redirect("login")
    return render(request, "settings/settings.html")


def water_sensor_data(request):
    if not request.user.is_authenticated:
        return redirect("login")
    get_water_sensor_data = water_sensor_data_api()
    return JsonResponse({"get_water_sensor_data": get_water_sensor_data})


def rain_sensor_data(request):
    if not request.user.is_authenticated:
        return redirect("login")
    get_rain_sensor_data = rain_sensor_data_api()
    return JsonResponse({"get_rain_sensor_data": get_rain_sensor_data})


def rain_gauge_data(request):
    if not request.user.is_authenticated:
        return redirect("login")
    get_rain_gauge_data = rain_gauge_data_api()
    return JsonResponse({"get_rain_gauge_data": get_rain_gauge_data})


def live_chart(request):
    if not request.user.is_authenticated:
        return redirect("login")
    return render(request, "live_chart/live_chart.html")
