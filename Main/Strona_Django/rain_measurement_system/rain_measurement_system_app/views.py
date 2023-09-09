from django.shortcuts import render


def index(request):
    return render(request, "index/index.html")


def login(request):
    return render(request, "login/login.html")


def register(request):
    return render(request, "register/register.html")


def control_panel(request):
    return render(request, "control_panel/control_panel.html")


def change_password(request):
    return render(request, "change_password/change_password.html")
