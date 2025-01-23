from django.shortcuts import render
from rest_framework.mixins import ListModelMixin, RetrieveModelMixin, CreateModelMixin, UpdateModelMixin, DestroyModelMixin
from rest_framework.viewsets import GenericViewSet, ModelViewSet
from .models import Driver
from .serializers import DriverSerializer


class DriverView(ModelViewSet):
    queryset = Driver.objects.all()
    serializer_class = DriverSerializer
    
# Create your views here.