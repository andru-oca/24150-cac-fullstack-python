from django.urls import path, include
from rest_framework.routers import DefaultRouter 
from .views import PeliculaViewSet

router=DefaultRouter()
router.register('', PeliculaViewSet, basename="pelicula")

urlpatterns = [
    path('', include(router.urls)) # rutas generadas automaticamente
]