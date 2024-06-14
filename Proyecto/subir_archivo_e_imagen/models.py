from django.db import models

# Create your models here.


class SubirDocumento(models.Model):
    documento = models.FileField(upload_to='documents/')
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    updated = models.DateTimeField(auto_now_add=False, auto_now=True)

    class Meta:
        db_table = "¨files"
        ordering = ['-created_at']
