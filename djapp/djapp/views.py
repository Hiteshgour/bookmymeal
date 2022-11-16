from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.conf import settings
from . import models
from myadmin import models as m

curl = settings.CURRENT_URL
media_url = settings.MEDIA_URL


# session unset
def sessionunset_middleware(get_response):
    def middleware(request):
        if request.path == '/userlogin/' or request.path == '/home/' or request.path == '/about/' or request.path == '/contact/' or request.path == '/packages/' or request.path == '/register/':
            request.session['sunm'] = None
            request.session['srole'] = None
        response = get_response(request)
        return response

    return middleware


def home(request):
    mlist = m.menu.objects.filter()
    catlist = m.Addcategory.objects.filter()
    return render(request, "home.html", {'mlist': mlist, 'curl': curl, 'catlist': catlist, 'media_url': media_url})


def showsubcat(request):
    cnm = request.GET.get('cnm')
    catlist = m.Addcategory.objects.filter()
    subclist = m.Addsubcategory.objects.filter(catnm=cnm)
    return render(request, "showsubcategory.html",
                  {'curl': curl, 'subclist': subclist, 'media_url': media_url, 'cnm': cnm, 'catlist': catlist})


def about(request):
    return render(request, "about.html", {'curl': curl})


def contact(request):
    return render(request, "contact.html", {'curl': curl})


def menu(request):
    mlist = m.menu.objects.filter()
    return render(request, "menu.html", {'curl': curl, 'media_url': media_url, 'mlist': mlist, })


def packages(request):
    packlist = m.package.objects.filter()
    return render(request, "packages.html", {'curl': curl, 'media_url': media_url, 'packlist': packlist})


def cart(request):
    return render(request, "cart.html", {'curl': curl})


def login(request):
    if request.method == "GET":
        return render(request, "userlogin.html", {'curl': curl, 'output': ''})
    else:
        user_email = request.POST.get("user_email")
        user_password = request.POST.get("user_password")
        userData = models.userregister.objects.filter(user_email=user_email, user_password=user_password, status=1)
        if len(userData) > 0:
            request.session['sunm'] = user_email
            request.session['srole'] = userData[0].role

            if userData[0].role == "user":
                myurl = curl + 'user/'
                return redirect(myurl)
            # print(userData[0].user_email)
            # return HttpResponse("<h1>hellow</h1>")
            if userData[0].role == "admin":
                myurl = curl + 'myadmin/'
                return redirect(myurl)
        else:
            return render(request, "userlogin.html",
                          {'curl': curl, 'output': 'invalid user please login ,or verify account'})


def register(request):
    if request.method == 'GET':
        if request.GET.get('output') == None:
            output = ""
        else:
            output = request.GET.get('output')

        return render(request, "register.html", {'curl': curl, 'output': output})
    else:
        full_name = request.POST.get('full_name')
        email = request.POST.get('email')
        password = request.POST.get('password')
        mobile_number = request.POST.get('mobile_number')
        dob = request.POST.get('dob')
        select_city = request.POST.get('select_city')
        gender = request.POST.get('gender')
        address = request.POST.get('address')
        Data = models.userregister(user_fullname=full_name, user_email=email, user_password=password,
                                   user_contact=mobile_number, user_dob=dob, city_id=select_city, gender=gender,
                                   user_address=address, role="user", status="0")
        Data.save()
        myurl = curl + 'register/?output=Register successfully'

        # return render(request,"register.html",{'curl':curl,'output':'Register successfully'})

        # return HttpResponse('register url with POST method')
        # import smtplib
        # from email.mime.multipart import MIMEMultipart
        # from email.mime.text import MIMEText
        #
        # me = "bookmymeal123@gmail.com"
        # you = email
        #
        # msg = MIMEMultipart('alternative')
        # msg['Subject'] = "Bookmymeal.com Verification Mail"
        # msg['From'] = me
        # msg['To'] = you
        #
        # html = """<html>
  		# 			<head></head>
  		# 			<body>
    	# 				<h1>Welcome to Bookmymeal.com</h1>
    	# 				<p>You have successfully registered , please click on the link below to verify your account</p>
    	# 				<h2>Username : """ + email + """</h2>
    	# 				<h2>Password : """ + str(password) + """</h2>
    	# 				<br>
    	# 				<a href='http://localhost:8000/verify?vemail=""" + email + """' >Click here to verify account</a>
  		# 			</body>
		# 		</html>
		# 		"""
        #
        # s = smtplib.SMTP('smtp.gmail.com', 587)
        # s.starttls()
        # s.login("bookmymeal123@gmail.com", "123@@123")
        #
        # part2 = MIMEText(html, 'html')
        #
        # msg.attach(part2)
        #
        # s.sendmail(me, you, str(msg))
        # s.quit()
        # print("mail send successfully....")

        return redirect(myurl)
    # return render(request,"register.html",{'curl':curl,'output':'Register successfully'})


def verify(request):
    vemail = request.GET.get('vemail')
    models.userregister.objects.filter(user_email=vemail).update(status=1)
    return redirect(curl + 'userlogin/')
