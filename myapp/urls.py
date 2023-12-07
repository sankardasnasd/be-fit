"""befit URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('login_post/', views.login_post),
    path('approverejectvendor/',views.approverejectvendor),
    path('approverejectvendor_post/',views.approverejectvendor_post),
    path('approvevendor/<id>',views.approvevendor),
    path('rejectvendor/<id>',views.rejectvendor),
    path('approvedvendors/',views.approvedvendors),
    path('approvedvendors_post/',views.approvedvendors_post),
    path('rejectedvendors/',views.rejectedvendors),
    path('rejectedvendors_post/',views.rejectedvendors_post),
    path('notify/',views.notify),
    path('notify_post/',views.notify_post),
    path('vnotify/',views.vnotify),
    path('vnotify_post/',views.vnotify_post),
    path('enotify/<id>',views.enotify),
    path('enotify_post/',views.enotify_post),
    path('edelete/<id>',views.edelete),
    path('ihome/',views.ihome),
    path('vuser/',views.vuser),
    path('vuser_post/',views.vuser_post),
    path('addinstruction/',views.addinstruction),
    path('addinstruction_post/',views.addinstruction_post),
    path('view_instruction_admin/',views.view_instruction_admin),
    path('view_instruction_admin_post/', views.view_instruction_admin_post),
    path('delete_inst/<id>',views.delete_inst),
    path('edit_inst/<id>',views.edit_inst),
    path('edit_inst_post/', views.edit_inst_post),

    path('instpchange/',views.instpchange),
    path('instpchange_post/',views.instpchange_post),

    path('pstatus/',views.pstatus),
    path('pstatus_post/',views.pstatus_post),
    path('sfeedback/<id>',views.sfeedback),
    path('sfeedback_post/',views.sfeedback_post),
    path('vufeedback/<id>',views.vufeedback),
    path('vufeedback_post/',views.vufeedback_post),
    path('userpchange/',views.userpchange),
    path('userpchange_post/',views.userpchange_post),
    path('usersignup/',views.usersignup),
    path('usersignup_post/',views.usersignup_post),
    path('uservproduct/',views.uservproduct),
    path('uservproduct_post/',views.uservproduct_post),
    path('buyproduct/<id>',views.buyproduct),
    path('uservprofile/',views.uservprofile),
    path('ueditprofile/',views.ueditprofile),
    path('ueditprofile_post/',views.ueditprofile_post),
    path('uhome/',views.uhome),
    path('uostatus/',views.uostatus),
    path('uostatus_post/',views.uostatus_post),
    path('ordercancel/<id>',views.ordercancel),
    path('view_instruction/',views.view_instruction),
    path('view_instruction_post/', views.view_instruction_post),

    #===vendor==============

    path('addproduct/',views.addproduct),
    path('addproduct_post/',views.addproduct_post),
    path('changp/',views.changp),
    path('changp_post/',views.changp_post),
    path('vsignup/',views.vsignup),
    path('vsignup_post/',views.vsignup_post),
    path('vvprofile/',views.vvprofile),
    path('editprofile/',views.editprofile),
    path('editprofile_post/',views.editprofile_post),
    path('vfeedback/<id>',views.vfeedback),
    path('vfeedback_post/',views.vfeedback_post),
    path('vproduct/',views.vproduct),
    path('vproduct_post/',views.vproduct_post),
    path('edit_product/<id>',views.edit_product),
    path('edit_product_post/',views.edit_product_post),
    path('deleteproduct/<id>',views.deleteproduct),
    path('vprequest/',views.vprequest),
    path('vprequest_post/',views.vprequest_post),
    path('approve_product_request/<id>',views.approve_product_request),
    path('reject_product_request/<id>',views.reject_product_request),
    path('view_approved_product_request/',views.view_approved_product_request),
    path('view_rejected_product_request/',views.view_rejected_product_request),
    path('vhome/',views.vhome),

    path('forget_password/',views.forget_password),
    path('forget_password_post/',views.forget_password_post),
    path('logout/',views.logout),


]
