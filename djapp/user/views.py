from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.conf import settings

from myadmin import models as m
from djapp import models as appmodel
curl=settings.CURRENT_URL
media_url=settings.MEDIA_URL


#middleware to check session for admin routes
def sessioncheckuser_middleware(get_response):
	def middleware(request):
		if request.path=='/user/' or request.path=='/user/userhome/' or request.path=='/user/userabout/' or request.path=='/user/usermenu/' or request.path=='/user/userpackage/' or request.path=='/user/usercontact/':
			if request.session['sunm']==None or request.session['srole']!='user':
				response = redirect(curl+'userlogin/')
			else:
				response = get_response(request)
		else:
			response = get_response(request)		
		return response	
	return middleware

# Create your views here.

def userhome(request):
	catlist=m.Addcategory.objects.filter()
	return render(request,"userhome.html",{'curl':curl,'catlist':catlist,'media_url':media_url,'sunm':request.session['sunm'],'srole':request.session['srole']})

def userabout(request):
	return render(request,"userabout.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})

def usermenu(request):
	mlist=m.menu.objects.filter()
	return render(request,"menu.html",{'curl':curl,'media_url':media_url,'mlist':mlist,})

def userpackage(request):
	packlist=m.package.objects.filter()
	return render(request,"packages.html",{'curl':curl,'media_url':media_url,'packlist':packlist})

def usercontact(request):
	return render(request,"usercontact.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})
	
def edituserprofile(request):
	sunm=request.session['sunm']
	if request.method=='GET':
		userdetails=appmodel.userregister.objects.filter(user_email=sunm)
	
		f=''
		m=''
		if userdetails[0].gender=='male':
			m='checked'
		else:
			f='checked'
		return render(request,"edituserprofile.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole'],'userdetails':userdetails[0],'m':m,'f':f})
	else:
		full_name=request.POST.get('full_name')
		email=request.POST.get('email')
		password=request.POST.get('password')
		mobile_number=request.POST.get('mobile_number')
		dob=request.POST.get('dob')
		select_city=request.POST.get('select_city')
		gender=request.POST.get('gender')
		address=request.POST.get('address')
		p=appmodel.userregister.objects.filter(user_email=sunm).update(user_fullname=full_name,user_password=password,user_contact=mobile_number,user_dob=dob,city_id=select_city,gender=gender,user_address=address)
		return redirect(curl+'userlogin/')

def usershowsubcat(request):
	cnm=request.GET.get('cnm')
	catlist=m.Addcategory.objects.filter()
	subclist=m.Addsubcategory.objects.filter(catnm=cnm)
	return render(request,"usershowsubcategory.html",{'curl':curl,'subclist':subclist,'media_url':media_url,'cnm':cnm,'catlist':catlist,'sunm':request.session['sunm'],'srole':request.session['srole']})

