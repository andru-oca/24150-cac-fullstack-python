from django.db import models

class Pelicula(models.Model):
    
    class Meta:
        db_table = 'pelicula'
    
    nombre = models.CharField(max_length=200, unique=True)
    fecha_de_release = models.DateField()
    genero = models.CharField(max_length=200)
    duracion = models.IntegerField()

    def __str__(self) -> str:
        return self.nombre
