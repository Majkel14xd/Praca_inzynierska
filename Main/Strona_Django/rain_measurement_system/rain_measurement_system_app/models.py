from django.db import models


class Logs(models.Model):
    ID = models.AutoField(primary_key=True)
    Data_zdarzenia = models.DateField()
    Godzina_zdarzenia = models.TimeField()
    Opis_zdarzenia = models.CharField(max_length=255)

    class Meta:
        db_table = "logs"
