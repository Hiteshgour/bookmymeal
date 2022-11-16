from django.db import models
from djapp import models as m

# Create your models here.

class Payment(models.Model):
	txnid = models.AutoField(primary_key=True)
	uid=models.CharField(max_length=100)
	adsid=models.CharField(max_length=100)
	adsprice=models.CharField(max_length=100)
	ptime=models.CharField(max_length=100)
