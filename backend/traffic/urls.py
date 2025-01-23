from rest_framework.routers import DefaultRouter

from .views import DriverView, ViolationTypeView

router = DefaultRouter()

router.register('drivers', DriverView, basename='driver')
router.register('violation-types', ViolationTypeView, basename='violation-type')