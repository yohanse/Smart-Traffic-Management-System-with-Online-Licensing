from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, CreateModelMixin, UpdateModelMixin, DestroyModelMixin
from rest_framework.viewsets import GenericViewSet, ModelViewSet
from .models import Driver, ViolationType
from .serializers import DriverSerializer, ViolationTypeSerializer


class DriverView(ModelViewSet):
    queryset = Driver.objects.all()
    serializer_class = DriverSerializer



class ViolationTypeView(ModelViewSet):
    queryset = ViolationType.objects.all()
    serializer_class = ViolationTypeSerializer