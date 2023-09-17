from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash
from .models import Logs
from .forms import LogsForm
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
    welcome_message = request.session.pop("welcome_message", None)
    get_water_sensor_data = (
        water_sensor_data_api()
    )  # Wywołujemy funkcję fetch_data_from_api() i przechowujemy odpowiedź w zmiennej response
    context = {
        "welcome_message": welcome_message,
        "get_water_sensor_data": get_water_sensor_data,
    }  # Dodajemy response do kontekstu
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
    return render(request, "profile/profile.html")


def logs(request):
    if not request.user.is_authenticated:
        return redirect("login")
    logs = None
    if request.method == "POST":
        form = LogsForm(request.POST)
        if form.is_valid():
            date_from = form.cleaned_data["date_from"]
            date_to = form.cleaned_data["date_to"]
            logs = Logs.objects.filter(data_zdarzenia__range=(date_from, date_to))
    else:
        form = LogsForm()
    return render(request, "logs/logs.html", {"form": form, "logs": logs})


def database_from_mysql(request):
    if not request.user.is_authenticated:
        return redirect("login")
    return render(request, "database_from_mysql/database_from_mysql.html")


def device_info(request):
    if not request.user.is_authenticated:
        return redirect("login")
    return render(request, "device_info/device_info.html")


def settings(request):
    if not request.user.is_authenticated:
        return redirect("login")
    return render(request, "settings/settings.html")


def water_sensor_data(request):
    get_water_sensor_data = water_sensor_data_api()  # Pobierz nową wartość response
    return JsonResponse({"get_water_sensor_data": get_water_sensor_data})
