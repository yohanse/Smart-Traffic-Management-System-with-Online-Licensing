from django.db import models
from django.conf import settings

class Officer(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, primary_key=True)


class ViolationType(models.Model):
    name = models.CharField(max_length=100, null=False, blank=False)
    description = models.TextField(null=True, blank=True)
    fine_amount = models.DecimalField(max_digits=10, decimal_places=2, null=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name
    

class Driver(models.Model):
    SEX_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female'),
    ]

    BLOOD_TYPE_CHOICES = [
        ('A+', 'A+'),
        ('A-', 'A-'),
        ('B+', 'B+'),
        ('B-', 'B-'),
        ('AB+', 'AB+'),
        ('AB-', 'AB-'),
        ('O+', 'O+'),
        ('O-', 'O-'),
    ]

    license_number = models.CharField(max_length=20, unique=True, null=False)
    first_name = models.CharField(max_length=100, null=False)
    last_name = models.CharField(max_length=100, null=False)
    date_of_birth = models.DateField(null=False)
    address = models.CharField(max_length=255, blank=True, null=True)
    sex = models.CharField(
        max_length=6,
        choices=SEX_CHOICES,
        null=False
    )
    region = models.CharField(max_length=100, null=False)
    woreda = models.CharField(max_length=100, null=False)
    house_number = models.CharField(max_length=100, null=False)
    phone_number = models.CharField(max_length=15, null=False)
    nationality = models.CharField(max_length=100, null=False)
    license_issue_date = models.DateField(null=False)
    blood_type = models.CharField(
        max_length=10,
        choices=BLOOD_TYPE_CHOICES, 
        null=False
    )
    profile_image = models.ImageField(upload_to="profile/images", null=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"{self.license_number} - {self.first_name} {self.last_name}"


class Violation(models.Model):
    driver = models.ForeignKey(
        Driver,
        on_delete=models.CASCADE,
        related_name='violations'
    )
    violation_type = models.ForeignKey(ViolationType, on_delete=models.PROTECT, related_name='violations')
    issued_by_officer = models.ForeignKey(
        Officer,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name='issued_violations'
    )
    
    location = models.CharField(max_length=255, null=True, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Violation ({self.violation_type}) for Driver ID {self.driver.id}"
    

class Ticket(models.Model):
    violation = models.OneToOneField(Violation, on_delete=models.CASCADE, primary_key=True)
    note = models.TextField(null=True, blank=True)
    issued_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Ticket for Driver ID {self.violation.driver.id}"