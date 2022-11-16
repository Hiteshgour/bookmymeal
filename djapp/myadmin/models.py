from django.db import models


# Create your models here.
class Addcategory(models.Model):
    catid = models.AutoField(primary_key=True)
    catnm = models.CharField(max_length=50)
    caticon = models.CharField(max_length=100)


class Addsubcategory(models.Model):
    subcatid = models.AutoField(primary_key=True)
    catnm = models.CharField(max_length=50)
    subcatnm = models.CharField(max_length=50)
    subcaticon = models.CharField(max_length=100)


class package(models.Model):
    packid = models.AutoField(primary_key=True)
    packnm = models.CharField(max_length=50)
    packprice = models.IntegerField()
    packdiscription = models.CharField(max_length=50)
    packimg = models.CharField(max_length=100)
    packduration = models.CharField(max_length=50)


class menu(models.Model):
    menuid = models.AutoField(primary_key=True)
    menunm = models.CharField(max_length=50)
    menuprice = models.IntegerField()
    menudiscription = models.CharField(max_length=50)
    menuimg = models.CharField(max_length=100)
    menucat = models.CharField(max_length=50)
