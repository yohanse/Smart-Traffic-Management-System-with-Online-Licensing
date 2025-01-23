from rest_framework.routers import DefaultRouter

from .views import DriverView

router = DefaultRouter()

router.register('drivers', DriverView, basename='driver')
