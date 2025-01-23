from rest_framework.serializers import Serializer, ModelSerializer
from .models import Driver, ViolationType

class DriverSerializer(ModelSerializer):
    class Meta:
        model = Driver
        fields = ['id', 'license_number', 'first_name', 'last_name', 'date_of_birth', 'address', 'sex', 'region', 'woreda', 'house_number', 'phone_number', 'nationality', 'license_issue_date', 'blood_type', 'profile_image']


class ViolationTypeSerializer(ModelSerializer):
    class Meta:
        model = ViolationType
        fields = ['id', 'name', 'description', 'fine_amount']
        