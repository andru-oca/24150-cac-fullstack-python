from django.urls import path, include
from .views import PeliculaViewSet
from rest_framework.routers import DefaultRouter 

router=DefaultRouter()
router.register('pelicula', PeliculaViewSet, basename="pelicula")

urlpatterns = [
    path('', include(router.urls)) # rutas generadas automaticamente
]