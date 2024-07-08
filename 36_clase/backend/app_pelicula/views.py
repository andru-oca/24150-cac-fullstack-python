from .models import Pelicula
from .serializer import PeliculaSerializer
from rest_framework import viewsets

class PeliculaViewSet(viewsets.ModelViewSet):
    queryset=Pelicula.objects.all()
    serializer_class=PeliculaSerializer
