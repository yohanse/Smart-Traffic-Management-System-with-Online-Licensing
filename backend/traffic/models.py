from django.db import models
from django.conf import settings


class ViolationType(models.Model):
    name = models.CharField(max_length=100, null=False, blank=False)
    description = models.TextField(null=True, blank=True)
    fine_amount = models.DecimalField(max_digits=10, decimal_places=2, null=False, blank=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.name