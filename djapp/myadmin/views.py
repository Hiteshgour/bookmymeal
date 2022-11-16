from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.conf import settings
from django.core.files.storage import FileSystemStorage

from . import models
from djapp import models as m

curl = settings.CURRENT_URL


# middleware to check session for admin routes
def sessioncheck_middleware(get_response):
    def middleware(request):
        if request.path == '/myadmin/' or request.path == '/myadmin/home/' or request.path == '/myadmin/menulist/' or request.path == '/myadmin/managepackage/' or request.path == '/myadmin/category/' or request.path == '/myadmin/subcategory/' or request.path == '/myadmin/customers/':
            if request.session['sunm'] == None or request.session['srole'] != 'admin':
                response = redirect(curl + 'userlogin/')
            else:
                response = get_response(request)
        else:
            response = get_response(request)
        return response

    return middleware


# Create your views here.

def home(request):
    return render(request, "adminhome.html",
                  {'curl': curl, 'sunm': request.session['sunm'], 'srole': request.session['srole']})


def menulist(request):
    if request.method == "GET":
        menulist = models.menu.objects.filter()
        return render(request, "menulist.html", {'menulist': menulist, 'curl': curl, 'sunm': request.session['sunm'],
                                                 'srole': request.session['srole']})
    else:
        mealnm = request.POST.get('mealnm')
        mealprice = request.POST.get('mealprice')
        mealdiscription = request.POST.get('mealdiscription')
        mealcatnm = request.POST.get('mealcatnm')
        mealimg = request.FILES['mealimg']
        img = FileSystemStorage()
        imgname = img.save(mealimg.name, mealimg)
        menu = models.menu(menunm=mealnm, menuprice=mealprice, menudiscription=mealdiscription, menucat=mealcatnm,
                           menuimg=imgname)
        menu.save()
        return redirect(curl + 'myadmin/menulist')


def delmenu(request):
    dmenu = request.GET.get('menuid')
    vcat = request.GET.get('vcat')
    if vcat == 'delete':
        models.menu.objects.filter(menuid=dmenu).delete()
        return redirect(curl + 'myadmin/menulist')


def managepackage(request):
    if request.method == "GET":
        packlist = models.package.objects.filter()
        return render(request, "managepackage.html",
                      {'packlist': packlist, 'curl': curl, 'sunm': request.session['sunm'],
                       'srole': request.session['srole']})
    else:
        packnm = request.POST.get('packnm')
        packprice = request.POST.get('packprice')
        packdiscription = request.POST.get('packdiscription')
        packduration = request.POST.get('packduration')
        packimg = request.FILES['packimg']
        img = FileSystemStorage()
        imgname = img.save(packimg.name, packimg)
        pack = models.package(packnm=packnm, packprice=packprice, packdiscription=packdiscription,
                              packduration=packduration, packimg=imgname)
        pack.save()
        return redirect(curl + 'myadmin/Addpackage')


def delpackage(request):
    dpack = request.GET.get('packid')
    vcat = request.GET.get('vcat')
    if vcat == 'delete':
        models.package.objects.filter(packid=dpack).delete()
        return redirect(curl + 'myadmin/Addpackage')


def category(request):
    if request.method == "GET":
        catlist = models.Addcategory.objects.filter()
        return render(request, "category.html",
                      {'curl': curl, 'output': '', 'catlist': catlist, 'sunm': request.session['sunm'],
                       'srole': request.session['srole']})
    else:
        catnm = request.POST.get('catnm')
        caticon = request.FILES['caticon']
        fs = FileSystemStorage()
        filename = fs.save(caticon.name, caticon)
        p = models.Addcategory(catnm=catnm, caticon=filename)
        p.save()
        return redirect(curl + 'myadmin/category/?output=Category added successfully')
    # return render(request,"category.html",{'curl':curl,'output':'Category added successfully'})


def managecategory(request):
    dcatid = request.GET.get('catid')
    vcat = request.GET.get('vcat')
    if vcat == 'delete':
        models.Addcategory.objects.filter(catid=dcatid).delete()
        return redirect(curl + 'myadmin/category')


def subcategory(request):
    clist = models.Addcategory.objects.filter()
    subclist = models.Addsubcategory.objects.filter()
    print(subclist)
    if request.method == "GET":
        return render(request, "subcategory.html", {'curl': curl, 'output': '', 'subclist': subclist, 'clist': clist,
                                                    'sunm': request.session['sunm'], 'srole': request.session['srole']})
    else:
        catnm = request.POST.get('catnm')
        subcatnm = request.POST.get('subcatnm')
        subcaticon = request.FILES['subcaticon']
        fs = FileSystemStorage()
        filename = fs.save(subcaticon.name, subcaticon)
        p = models.Addsubcategory(subcatnm=subcatnm, catnm=catnm, subcaticon=filename)
        p.save()
        print(subcatnm)
        return redirect(curl + 'myadmin/subcategory')
    # return render(request,"subcategory.html",{'curl':curl,'output':'subcategory added successfully','clist':clist})


def managesubcategory(request):
    dsubcatid = request.GET.get('subcatid')
    vsubcat = request.GET.get('vsubcat')
    if vsubcat == 'delete':
        models.Addsubcategory.objects.filter(subcatid=dsubcatid).delete()
        return redirect(curl + 'myadmin/subcategory')


'''def todaysmeal(request):
	return render(request,"todaysmeal.html",{'curl':curl,'sunm':request.session['sunm'],'srole':request.session['srole']})'''


def customers(request):
    userlist = m.userregister.objects.filter(role='user')
    return render(request, "customers.html", {'curl': curl, 'userlist': userlist, 'sunm': request.session['sunm'],
                                              'srole': request.session['srole']})


def customerstatus(request):
    user_id = request.GET.get('user_id')
    vstatus = request.GET.get('vstatus')
    if vstatus == 'block':
        m.userregister.objects.filter(user_id=user_id).update(status=0)
    elif vstatus == 'unblock':
        m.userregister.objects.filter(user_id=user_id).update(status=1)
    else:
        m.userregister.objects.filter(user_id=user_id).delete()
    return redirect(curl + 'myadmin/customers')
