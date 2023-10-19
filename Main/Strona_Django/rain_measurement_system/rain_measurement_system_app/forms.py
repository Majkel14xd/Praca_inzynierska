from django import forms


class LogsForm(forms.Form):
    date_from = forms.DateField(
        label="Data od",
        widget=forms.DateInput(attrs={"type": "date"}),
        input_formats=["%Y-%m-%d"],
    )
    date_to = forms.DateField(
        label="Data do",
        widget=forms.DateInput(attrs={"type": "date"}),
        input_formats=["%Y-%m-%d"],
    )


class Datafrommuysqlform(forms.Form):
    MODELS_CHOICES = [
        ("rain_gauge", "Rain Gauge"),
        ("rain_sensor", "Rain Sensor"),
        ("water_sensor", "Water Sensor"),
    ]

    model = forms.ChoiceField(choices=MODELS_CHOICES)
    date_from = forms.DateField(widget=forms.DateInput(attrs={"type": "date"}))
    date_to = forms.DateField(widget=forms.DateInput(attrs={"type": "date"}))
