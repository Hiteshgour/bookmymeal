from django.contrib import admin
from django.urls import path,include
from . import views

urlpatterns=[
	path('',views.userhome),
	path('userhome/',views.userhome),
	path('usershowsubcat/',views.usershowsubcat),
	path('usermenu/',views.usermenu),
	path('userpackage/',views.userpackage),
	path('usercontact/',views.usercontact),
	path('edituserprofile/',views.edituserprofile),
	path('userabout/',views.userabout)

]
