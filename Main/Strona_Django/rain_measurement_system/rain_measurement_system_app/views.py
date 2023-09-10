from django.shortcuts import render, redirect
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate, login as auth_login
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import logout
from django.shortcuts import HttpResponseRedirect
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib import messages
from django.contrib.auth import update_session_auth_hash


def index(request):
    if request.user.is_authenticated:
        # Użytkownik jest zalogowany, przekieruj na inną stronę
        return redirect(
            "control_panel"
        )  # Zaktualizuj 'inna_strona' na nazwę swojego URL-a
    else:
        # Użytkownik nie jest zalogowany, możesz dodać tutaj odpowiednią obsługę
        return render(request, "index/index.html")


def indexafterlogin(request):
    return render(request, "index/index.html")


def login(request):
    if request.user.is_authenticated:
        return render(request, "control_panel/control_panel.html")
    if request.method == "POST":
        username = request.POST["username"]
        password = request.POST["password"]
        user = authenticate(request, username=username, password=password)
        if user is not None:
            auth_login(request, user)
            return redirect("control_panel")
        else:
            msg = "Błąd logowania, nieprawidłowy login lub hasło"
            form = AuthenticationForm(request.POST)
            return render(request, "login/login.html", {"form": form, "msg": msg})
    else:
        form = AuthenticationForm()
        return render(request, "login/login.html", {"form": form})


def control_panel(request):
    return render(request, "control_panel/control_panel.html")


def change_password(request):
    if request.method == "POST":
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, _("Your password was successfully updated!"))
            return redirect("change_password")
        else:
            messages.error(request, ("Please correct the error below."))
    else:
        form = PasswordChangeForm(request.user)
    return render(request, "change_password/change_password.html", {"form": form})


def signout(request):
    logout(request)
    return redirect("index")
