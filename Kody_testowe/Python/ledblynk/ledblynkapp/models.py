from django.db import models


class SensorData(models.Model):
    timestamp = models.DateTimeField()
    pin = models.TextField()
    value = models.IntegerField()

    class Meta:
        db_table = "sensordata"
