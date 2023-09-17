from django.db import models


class Logs(models.Model):
    id = models.AutoField(
        db_column="ID", primary_key=True
    )  # Field name made lowercase.
    data_zdarzenia = models.DateField(
        db_column="Data_zdarzenia"
    )  # Field name made lowercase.
    godzina_zdarzenia = models.TimeField(
        db_column="Godzina_zdarzenia"
    )  # Field name made lowercase.
    opis_zdarzenia = models.CharField(
        db_column="Opis_zdarzenia", max_length=255
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "logs"


class RainGaugae(models.Model):
    id = models.AutoField(
        db_column="ID", primary_key=True
    )  # Field name made lowercase.
    data_odczytu = models.DateField(
        db_column="Data_odczytu"
    )  # Field name made lowercase.
    godzina_odczytu = models.TimeField(
        db_column="Godzina_odczytu"
    )  # Field name made lowercase.
    wartosc = models.IntegerField(db_column="Wartosc")  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "rain_gaugae"


class RainSensor(models.Model):
    id = models.AutoField(
        db_column="ID", primary_key=True
    )  # Field name made lowercase.
    data_odczytu = models.DateField(
        db_column="Data_odczytu"
    )  # Field name made lowercase.
    godzina_odczytu = models.TimeField(
        db_column="Godzina_odczytu"
    )  # Field name made lowercase.
    wartosc = models.IntegerField(db_column="Wartosc")  # Field name made lowercase.
    wartosc_tekstowa = models.CharField(
        db_column="Wartosc_tekstowa", max_length=255
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "rain_sensor"


class WaterSensor(models.Model):
    id = models.AutoField(
        db_column="ID", primary_key=True
    )  # Field name made lowercase.
    data_odczytu = models.DateField(
        db_column="Data_odczytu"
    )  # Field name made lowercase.
    godzina_odczytu = models.TimeField(
        db_column="Godzina_odczytu"
    )  # Field name made lowercase.
    wartosc = models.IntegerField(db_column="Wartosc")  # Field name made lowercase.
    wartosc_tekstowa = models.CharField(
        db_column="Wartosc_tekstowa", max_length=255
    )  # Field name made lowercase.
    alert = models.CharField(
        db_column="Alert", max_length=255
    )  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = "water_sensor"
