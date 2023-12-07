import datetime
import smtplib

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from myapp.models import *


def login(request):
    return render(request,'login_index.html')
def login_post(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    log=Login.objects.filter(username=username,password=password)
    if log.exists():
        obj=Login.objects.get(username=username,password=password)
        request.session['lid']=obj.id
        if obj.type == 'admin':
            return HttpResponse('''<script>alert('successfully logined');window.location='/myapp/ihome/'</script>''')
        elif obj.type == 'user':
            return HttpResponse('''<script>alert('successfully logined');window.location='/myapp/uhome/'</script>''')
        elif obj.type == 'vendor':
            return HttpResponse('''<script>alert('successfully logined');window.location='/myapp/vhome/'</script>''')
        else:
            return HttpResponse('''<script>alert('invalid logined');window.location='/myapp/login/'</script>''')

    else:
        return HttpResponse('''<script>alert('invalid logined');window.location='/myapp/login/'</script>''')


def approverejectvendor(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Vendor.objects.filter(status='pending')
    return render(request,'instructor/approve_reject_vendor.html',{'data':res})

def approvevendor(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress=Login.objects.filter(pk=id).update(type='vendor')
    res=Vendor.objects.filter(LOGIN_id=id).update(status='approved')
    return HttpResponse('<script>alert("you approved vendor");window.location="/myapp/approverejectvendor"</script>')

def rejectvendor(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress = Login.objects.filter(pk=id).update(type='rejected')
    res=Vendor.objects.filter(LOGIN_id=id).update(status='rejected')
    return HttpResponse('<script>alert("you rejected vendor");window.location="/myapp/approverejectvendor"</script>')

def approverejectvendor_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search=request.POST['textfield']
    res = Vendor.objects.filter(status='pending',name__icontains=search)
    return render(request, 'instructor/approve_reject_vendor.html', {'data': res})

def approvedvendors(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Vendor.objects.filter(status='approved')
    return render(request,'instructor/approvedvendors.html',{'data':res})

def approvedvendors_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search=request.POST['textfield']
    res = Vendor.objects.filter(status='approved', name__icontains=search)
    return render(request, 'instructor/approvedvendors.html', {'data': res})

def rejectedvendors(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Vendor.objects.filter(status='rejected')
    return render(request,'instructor/rejectvendors.html',{'data':res})

def rejectedvendors_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search=request.POST['textfield']
    res=Vendor.objects.filter(status='rejected',name__icontains=search)
    return render(request,'instructor/rejectvendors.html',{'data':res})

def notify(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'instructor/notification.html')

def notify_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    addnotification=request.POST['textarea']
    date=datetime.datetime.today()
    obj=Notification()
    obj.date_and_time=date
    obj.notification=addnotification
    obj.save()
    return HttpResponse('<script>alert("notification added successfully");window.location="/myapp/notify/"</script>')


def vnotify(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Notification.objects.all()
    return render(request,'instructor/view_notification.html',{'data':res})

def vnotify_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm=request.POST['textfield']
    to=request.POST['textfield2']
    res = Notification.objects.filter(date_and_time__range=[fromm,to])
    return render(request, 'instructor/view_notification.html', {'data': res})

def enotify(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Notification.objects.get(id=id)
    return render(request,'instructor/edit_notification.html',{'data':res})

def enotify_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    id=request.POST['nid']
    editnotification = request.POST['textarea']
    res=Notification.objects.filter(id=id).update(notification=editnotification)
    return HttpResponse('<script>alert(" Notification editted");window.location="/myapp/vnotify/"</script>')

def edelete(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Notification.objects.filter(id=id).delete()
    return HttpResponse('<script>alert("notification deleted");window.location="/myapp/vnotify/"</script>')




def vuser(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=User.objects.all()
    return render(request,'instructor/view_user.html',{'data':res})

def vuser_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search=request.POST['textfield']
    res = User.objects.filter(name__icontains=search)
    return render(request,'instructor/view_user.html',{'data':res})

def instpchange(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'instructor/instructor_change_password.html')

def instpchange_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    cpassword=request.POST['textfield']
    npassword=request.POST['textfield2']
    conpassword=request.POST['textfield3']
    log=Login.objects.filter(id=request.session["lid"],password=cpassword)
    if log.exists():
        if npassword==conpassword:
            log.update(password=npassword)
            return HttpResponse('<script>alert("password changed");window.location="/myapp/login/"</script>')
        else:
            return HttpResponse('<script>alert("password doesnot match");history.back()</script>')
    return HttpResponse('<script>alert("current password doesnot match ");history.back()</script>')

def ihome(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'instructor/home_index.html')

def addinstruction(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'instructor/addinstruction.html')

def addinstruction_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    inst = request.POST['textarea']
    photo = request.FILES['textfield4']
    date = datetime.datetime.now().strftime('%Y%m%d-%H%M%S') + '.jpg'
    fs = FileSystemStorage()
    fs.save(date, photo)
    path = fs.url(date)
    obj = Addinstruction()
    obj.inst = inst
    obj.photo=path
    obj.date = datetime.datetime.now().date()
    obj.save()
    return HttpResponse('<script>alert("instruction added successfully");window.location="/myapp/addinstruction/"</script>')

def view_instruction_admin(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Addinstruction.objects.all()
    return render(request, 'instructor/view_instruction_admin.html', {'data': res})

def view_instruction_admin_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm=request.POST['textfield']
    to=request.POST['textfield2']
    res = Addinstruction.objects.filter(date_and_time__range=[fromm,to])
    return render(request, 'instructor/view_instruction_admin.html', {'data': res})

def delete_inst(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Addinstruction.objects.filter(id=id).delete()
    return HttpResponse('<script>alert("instruction deleted");window.location="/myapp/view_instruction_admin/"</script>')

def edit_inst(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Addinstruction.objects.get(id=id)
    return render(request,'instructor/edit_instruction_admin.html',{'data':res})

def edit_inst_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    id=request.POST['nid']
    edit_instruction = request.POST['textarea']
    if 'textfield4' in request.FILES:
        photo = request.FILES['textfield4']
        from datetime import datetime
        date = "instructor/" + datetime.now().strftime('%y%m%d-%H%M%S') + ".jpg"
        fs = FileSystemStorage()
        fn = fs.save(date, photo)
        path = fs.url(date)
        obj1=Addinstruction.objects.filter(pk=id).update(inst=edit_instruction,photo=path,date=datetime.now().today())
        return HttpResponse('<script>alert("updated successfully .. ");window.location="/myapp/view_instruction_admin/"</script>')
    else:
        from datetime import datetime
        obj1=Addinstruction.objects.filter(pk=id).update(inst=edit_instruction,date=datetime.now().today())

        return HttpResponse('<script>alert("updated successfully .. ");window.location="/myapp/view_instruction_admin/"</script>')



    # res=Addinstruction.objects.filter(id=id).update(inst=edit_instruction)
    # return HttpResponse('<script>alert(" Instruction editted");window.location="/myapp/view_instruction_admin/"</script>')


############user


def pstatus(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request.objects.all()
    return render(request,'user/product_status.html',{'data': res})

def pstatus_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm=request.POST['textfield']
    to=request.POST['textfield2']
    res = Product_request.objects.filter(date_and_time__range=[fromm,to])
    return render(request, 'user/product_status.html', {'data': res})

def sfeedback(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'user/send_feedback.html',{'id':id})

def sfeedback_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    feedbacksend=request.POST['textarea']
    pid=request.POST['pid']


    sobj=Feedback()
    sobj.feedbacks=feedbacksend
    from datetime import datetime
    sobj.date=datetime.now().strftime('%Y-%m-%d')
    sobj.user=User.objects.get(LOGIN=request.session['lid'])
    sobj.PRODUCT_id=pid
    sobj.save()
    return HttpResponse('<script>alert("feedback added successfully");window.location="/myapp/uservproduct/"</script>')

def vufeedback(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Feedback.objects.filter(PRODUCT_id=id)
    return render(request,'user/user_view_feedback.html',{'data':res})

def vufeedback_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm = request.POST['textfield']
    to = request.POST['textfield2']
    res = Feedback.objects.filter(date__range=[fromm, to])
    return render(request, 'user/user_view_feedback.html', {'data': res})



def userpchange(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'user/user_change_password.html')
def userpchange_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    cpassword = request.POST['textfield']
    npassword = request.POST['textfield2']
    conpassword = request.POST['textfield3']
    log = Login.objects.filter(id=request.session["lid"], password=cpassword)
    if log.exists():
        if npassword == conpassword:
            log.update(password=npassword)
            return HttpResponse('<script>alert("password changed");window.location="/myapp/login/"</script>')
        else:
            return HttpResponse('<script>alert("password doesnot match");history.back()</script>')
    return HttpResponse('<script>alert("current password doesnot match ");history.back()</script>')

def usersignup(request):

    return render(request,'user/signup_index.html')
def usersignup_post(request):

    name=request.POST['textfield']
    email=request.POST['textfield2']
    phone=request.POST['textfield3']
    from datetime import datetime
    date = "user/" + datetime.now().strftime('%y%m%d-%H%M%S') + ".jpg"
    photo = request.FILES['textfield4']
    fs = FileSystemStorage()
    fn = fs.save(date, photo)
    path = fs.url(date)
    gender=request.POST['RadioGroup1']
    dob=request.POST['textfield5']
    place=request.POST['textfield6']
    district=request.POST['textfield7']
    pin=request.POST['textfield8']
    password=request.POST['textfield9']
    con_password=request.POST['textfield10']
    if password==con_password:
        obj=Login()
        obj.username=email
        obj.password=con_password
        obj.type="user"
        obj.save()
        obj1=User()
        obj1.name=name
        obj1.email=email
        obj1.phone=phone
        obj1.photo=path

        obj1.gender=gender
        obj1.dob=dob
        obj1.place=place
        obj1.district=district
        obj1.pin=pin
        obj1.LOGIN=obj
        obj1.save()
        return HttpResponse(
            '<script>alert("registered successfully ..");window.location="/myapp/login/"</script>')
    else:
        return HttpResponse('<script>alert("password missmatch");window.location="/myapp/usersignup/"</script>')

def uservproduct(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Product.objects.all()

    return render(request, 'user/user_view_products.html', {'data': res})

def uservproduct_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    product_search=request.POST['textfield']
    res = Product.objects.filter(name__icontains=product_search)
    return render(request, 'user/user_view_products.html', {'data': res})

def buyproduct(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request()
    from datetime import datetime
    res.date_and_time=datetime.now().strftime('%Y-%m-%d')
    res.status='pending'
    res.product_id=id
    res.userid=User.objects.get(LOGIN=request.session['lid'])
    res.save()
    # res=Product_request.objects.filter(id=id).update(status='requested')
    return HttpResponse('<script>alert("requested");window.location="/myapp/uservproduct/"</script>')

def uostatus(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request.objects.filter(userid__LOGIN_id=request.session['lid'])
    return render(request,'user/user_view_ordered_status.html',{'data':res})
def uostatus_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search=request.POST['textfield']
    res=Product_request.objects.filter(userid__LOGIN_id=request.session['lid'],product__name__icontains=search)
    return render(request,'user/user_view_ordered_status.html',{'data':res})

def ordercancel(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request.objects.filter(id=id).delete()
    return HttpResponse('<script>alert("cancelled");window.location="/myapp/uostatus/"</script>')




def uservprofile(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress = User.objects.get(LOGIN_id=request.session['lid'])
    return render(request, 'user/user_view_profile.html', {'res': ress})

def ueditprofile(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress = User.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'user/user_edit.html',{'res':ress})


def ueditprofile_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    name=request.POST['textfield']
    email=request.POST['textfield2']
    phone=request.POST['textfield3']

    gender=request.POST['RadioGroup1']
    dob=request.POST['textfield5']
    place=request.POST['textfield6']
    district=request.POST['textfield7']
    pin=request.POST['textfield8']

    if 'textfield4' in request.FILES:
        photo = request.FILES['textfield4']
        from datetime import datetime
        date = "user/" + datetime.now().strftime('%y%m%d-%H%M%S') + ".jpg"
        fs = FileSystemStorage()
        fn = fs.save(date, photo)
        path = fs.url(date)
        obj1=User.objects.get(LOGIN_id=request.session['lid'])
        obj1.name=name
        obj1.email=email
        obj1.phone=phone
        obj1.photo=path

        obj1.gender=gender
        obj1.dob=dob
        obj1.place=place
        obj1.district=district
        obj1.pin=pin
        obj1.save()
        return HttpResponse('<script>alert("updated successfully .. please wait for the approval");window.location="/myapp/uservprofile/"</script>')
    else:
        obj1 = User.objects.get(LOGIN_id=request.session['lid'])
        obj1.name = name
        obj1.email = email
        obj1.phone = phone
        obj1.gender = gender
        obj1.dob = dob
        obj1.place = place
        obj1.district = district
        obj1.pin = pin
        obj1.save()
        return HttpResponse('<script>alert("updated successfully .. please wait for the approval");window.location="/myapp/uservprofile/"</script>')


def uhome(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'user/home_index.html')

def view_instruction(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Addinstruction.objects.all()
    return render(request, 'user/view_instruction.html', {'data': res})

def view_instruction_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm=request.POST['textfield']
    to=request.POST['textfield2']
    res = Addinstruction.objects.filter(date_and_time__range=[fromm,to])
    return render(request, 'user/view_instruction.html', {'data': res})


#########vendor



def addproduct(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'vendors/add_product.html')
def addproduct_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    product_name=request.POST['textfield']
    photo=request.FILES['textfield2']
    description=request.POST['textarea']
    price=request.POST['textfield3']
    date=datetime.datetime.now().strftime('%Y%m%d-%H%M%S')+'.jpg'
    fs=FileSystemStorage()
    fs.save(date,photo)
    path=fs.url(date)
    obj=Product()
    obj.name=product_name
    obj.description=description
    obj.price=price
    obj.photo=path
    obj.VENDOR=Vendor.objects.get(LOGIN=request.session['lid'])
    obj.save()
    return HttpResponse('<script>alert("product added");window.location="/myapp/addproduct/"</script>')

def changp(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'vendors/change_password.html')
def changp_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    cpassword = request.POST['textfield']
    npassword = request.POST['textfield2']
    conpassword = request.POST['textfield3']
    log = Login.objects.filter(id=request.session["lid"], password=cpassword)
    if log.exists():
        if npassword == conpassword:
            log.update(password=npassword)
            return HttpResponse('<script>alert("password changed");window.location="/myapp/login/"</script>')
        else:
            return HttpResponse('<script>alert("password doesnot match");history.back()</script>')
    return HttpResponse('<script>alert("current password doesnot match ");history.back()</script>')

def vsignup(request):
    return render(request,'vendors/signup_index.html')
def vsignup_post(request):
    name = request.POST['textfield']
    email = request.POST['textfield2']
    phone = request.POST['textfield3']
    from datetime import datetime
    date="vendor/"+datetime.now().strftime('%y%m%d-%H%M%S')+".jpg"
    photo = request.FILES['textfield4']
    fs=FileSystemStorage()
    fn=fs.save(date,photo)
    path=fs.url(date)
    gender = request.POST['RadioGroup1']
    place = request.POST['textfield5']
    district = request.POST['textfield6']
    pin = request.POST['textfield7']
    password = request.POST['textfield8']
    con_password = request.POST['textfield9']

    if password==con_password:

        lobj=Login()
        lobj.username=email
        lobj.password=password
        lobj.type='pending'
        lobj.save()

        vobj=Vendor()
        vobj.name=name
        vobj.email=email
        vobj.phone=phone
        vobj.photo=path
        vobj.gender=gender
        vobj.place=place
        vobj.district=district
        vobj.pin=pin
        vobj.status='pending'
        vobj.LOGIN_id=lobj.id
        vobj.save()

        return HttpResponse('<script>alert("registered successfully .. please wait for the approval");window.location="/myapp/login/"</script>')
    else:
        return HttpResponse('<script>alert("password missmatch");window.location="/myapp/login/"</script>')

def vvprofile(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress = Vendor.objects.get(LOGIN_id= request.session['lid'])
    return render(request, 'vendors/vendor_view_profile.html', {'res': ress})
def editprofile(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    ress = Vendor.objects.get(LOGIN_id=request.session['lid'])
    return render(request,'vendors/vendor_edit.html',{'res':ress})
def editprofile_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    name = request.POST['textfield']
    email = request.POST['textfield2']
    phone = request.POST['textfield3']

    gender = request.POST['RadioGroup1']
    place = request.POST['textfield5']
    district = request.POST['textfield6']
    pin = request.POST['textfield7']
    if 'textfield4' in request.FILES:
        photo = request.FILES['textfield4']
        from datetime import datetime
        date = "vendor/" + datetime.now().strftime('%y%m%d-%H%M%S') + ".jpg"
        fs = FileSystemStorage()
        fn = fs.save(date, photo)
        path = fs.url(date)
        vobj = Vendor.objects.get(LOGIN_id=request.session['lid'])
        vobj.name = name
        vobj.email = email
        vobj.phone = phone
        vobj.photo = path
        vobj.gender = gender
        vobj.place = place
        vobj.district = district
        vobj.pin = pin

        vobj.save()
        return HttpResponse(
            '<script>alert("updated successfully .. please wait for the approval");window.location="/myapp/vvprofile/"</script>')
    else:
        vobj = Vendor.objects.get(LOGIN_id=request.session['lid'])
        vobj.name = name
        vobj.email = email
        vobj.phone = phone
        vobj.gender = gender
        vobj.place = place
        vobj.district = district
        vobj.pin = pin

        vobj.save()
        return HttpResponse( '<script>alert("updated successfully .. please wait for the approval");window.location="/myapp/vvprofile/"</script>')


def vfeedback(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Feedback.objects.filter(PRODUCT=id)
    return render(request, 'vendors/view_feedback.html', {'data': res})
def vfeedback_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm = request.POST['textfield']
    to = request.POST['textfield2']
    res = Feedback.objects.filter(date__range=[fromm, to])
    return render(request, 'vendors/view_feedback.html', {'data': res})

def vproduct(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Product.objects.filter(VENDOR__LOGIN_id=request.session['lid'])
    return render(request,'vendors/view_product.html',{'data': res})
def vproduct_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    search = request.POST['textfield']
    res = Product.objects.filter(name__icontains=search)
    return render(request, 'vendors/view_product.html', {'data': res})

def edit_product(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product.objects.get(id=id)
    return render(request, 'vendors/edit_product.html',{'data':res})

def edit_product_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    product_name = request.POST['textfield']
    photo = request.FILES['textfield2']
    description = request.POST['textarea']
    price = request.POST['textfield3']
    pid=request.POST['pid']
    date = datetime.datetime.now().strftime('%Y%m%d-%H%M%S') + '.jpg'
    fs = FileSystemStorage()
    fs.save(date, photo)
    path = fs.url(date)
    obj = Product.objects.get(id=pid)
    obj.name = product_name
    obj.description = description
    obj.price = price
    obj.photo = path
    obj.VENDOR = Vendor.objects.get(LOGIN=request.session['lid'])
    obj.save()
    return HttpResponse('<script>alert(" product editted");window.location="/myapp/vproduct/"</script>')
def deleteproduct(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product.objects.filter(id=id).delete()
    return HttpResponse('<script>alert("product deleted");window.location="/myapp/vproduct/"</script>')



def vprequest(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Product_request.objects.filter(status='pending',product__VENDOR__LOGIN_id=request.session['lid'])
    return render(request,'vendors/view_product_request.html',{'data': res})

def approve_product_request(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request.objects.filter(id=id).update(status='confirmed')
    return HttpResponse('<script>alert("you approved product request");window.location="/myapp/vprequest/"</script>')

def reject_product_request(request,id):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res=Product_request.objects.filter(id=id).update(status='rejected')
    return HttpResponse('<script>alert("you approved rejected request");window.location="/myapp/vprequest"</script>')

def view_approved_product_request(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Product_request.objects.filter(status='confirmed',product__VENDOR__LOGIN_id=request.session['lid'])
    return render(request,'vendors/view_approved_product_request.html',{'data': res})

def view_rejected_product_request(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    res = Product_request.objects.filter(status='rejected',product__VENDOR__LOGIN_id=request.session['lid'])
    return render(request,'vendors/view_rejected_product_request.html',{'data': res})


def vprequest_post(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    fromm = request.POST['textfield']
    to = request.POST['textfield2']
    res = Product_request.objects.filter(date_and_time__range=[fromm, to])
    return render(request, 'vendors/view_product_request.html', {'data': res})

def vhome(request):
    if request.session['lid']=="":
        return redirect('/myapp/login/')
    return render(request,'vendors/home_index.html')



def forget_password(request):
    return render(request,'forgot_index.html')

def forget_password_post(request):
    em = request.POST['em_add']
    res=Login.objects.filter(username=em)
    if not res.exists():
        return HttpResponse('<script>alert("invalid email");window.location="/myapp/login/"</script>')
    else:
        res = Login.objects.get(username=em)
        import random
        new_pass = random.randint(0000,9999)
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login("neerajproject123@gmail.com", "tweg wadm zhoq yrnt")        # App Password

        to = em
        subject = "Test Email"
        body = "Your new password is " + str(new_pass)
        msg = "Subject:"+subject +"\n\n" +body
        server.sendmail("s@gmail.com", to, msg)

        # Disconnect from the server
        server.quit()
        Login.objects.filter(username=em).update(password=new_pass)
        return HttpResponse('<script>alert("success");window.location="/myapp/login/"</script>')


def logout(request):
    request.session['lid']=""
    return HttpResponse('<script>alert("logged out");window.location="/myapp/login/"</script>')

