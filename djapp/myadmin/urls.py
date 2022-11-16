from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns=[
	path('',views.home),
	path('home/',views.home),
	path('category/',views.category),
	path('menulist/',views.menulist),
	path('Addpackage/',views.managepackage),
	path('delpackage/',views.delpackage),
	path('delmenu/',views.delmenu),
	path('subcategory/',views.subcategory),
	path('customers/',views.customers),
	path('managecategory/',views.managecategory),
	path('managesubcategory/',views.managesubcategory),
	path('customerstatus/',views.customerstatus)

	
]
