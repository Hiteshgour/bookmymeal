from django.db import models


class userregister(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_fullname = models.CharField(max_length=20)
    user_email = models.CharField(max_length=50)
    user_password = models.CharField(max_length=10)
    user_contact = models.CharField(max_length=20)
    user_dob = models.CharField(max_length=20)
    city_id = models.CharField(max_length=10)
    gender = models.CharField(max_length=20)
    user_address = models.CharField(max_length=1000)
    role = models.CharField(max_length=20)
    status = models.IntegerField()
