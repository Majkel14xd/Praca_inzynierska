from django.db import models


class Logs(models.Model):
    id = models.AutoField(db_column="ID", primary_key=True)
    data_zdarzenia = models.DateField(db_column="Data_zdarzenia")
    godzina_zdarzenia = models.TimeField(db_column="Godzina_zdarzenia")
    opis_zdarzenia = models.CharField(db_column="Opis_zdarzenia", max_length=255)

    class Meta:
        managed = False
        db_table = "logs"


class RainGaugae(models.Model):
    id = models.AutoField(db_column="ID", primary_key=True)
    data_odczytu = models.DateField(db_column="Data_odczytu")
    godzina_odczytu = models.TimeField(db_column="Godzina_odczytu")
    wartosc = models.IntegerField(db_column="Wartosc")

    class Meta:
        managed = False
        db_table = "rain_gaugae"


class RainSensor(models.Model):
    id = models.AutoField(db_column="ID", primary_key=True)
    data_odczytu = models.DateField(db_column="Data_odczytu")
    godzina_odczytu = models.TimeField(db_column="Godzina_odczytu")
    wartosc = models.IntegerField(db_column="Wartosc")
    wartosc_tekstowa = models.CharField(db_column="Wartosc_tekstowa", max_length=255)

    class Meta:
        managed = False
        db_table = "rain_sensor"


class WaterSensor(models.Model):
    id = models.AutoField(db_column="ID", primary_key=True)
    data_odczytu = models.DateField(db_column="Data_odczytu")
    godzina_odczytu = models.TimeField(db_column="Godzina_odczytu")
    wartosc = models.IntegerField(db_column="Wartosc")
    wartosc_tekstowa = models.CharField(db_column="Wartosc_tekstowa", max_length=255)
    alert = models.CharField(db_column="Alert", max_length=255)

    class Meta:
        managed = False
        db_table = "water_sensor"
