from django.db import models
from datetime import date

# Create your models here.
class Pelicula(models.Model):
    class Meta:
        db_table = "peliculas_mysql"

    nombre = models.CharField(max_length=200, unique=True)
    duracion = models.IntegerField()
    genero = models.CharField(max_length=200)
    fecha_release = models.DateField(default=date.today)

    def __str__(self):
        return self.nombre