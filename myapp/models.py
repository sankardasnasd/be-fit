from django.db import models

# Create your models here.
from django.urls import reverse


class Login(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)
class User(models.Model):
    name=models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.BigIntegerField(max_length=10)
    photo = models.CharField(max_length=500)
    gender = models.CharField(max_length=100)
    dob = models.DateField()
    place=models.CharField(max_length=100)
    pin = models.CharField(max_length=100)
    district = models.CharField(max_length=100)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
class Instructor(models.Model):
    details=models.CharField(max_length=100)
class Vendor(models.Model):
    name=models.CharField(max_length=100,default="")
    email=models.CharField(max_length=100,default="")
    phone=models.BigIntegerField(max_length=10,default="")
    photo=models.CharField(max_length=500,default="")
    gender=models.CharField(max_length=100,default="")
    place=models.CharField(max_length=100,default="")
    district=models.CharField(max_length=100,default="")
    pin=models.CharField(max_length=100,default="")
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)
    status=models.CharField(max_length=10,default="")
class Notification(models.Model):
    date_and_time=models.DateField()
    notification=models.CharField(max_length=100)


class Product(models.Model):
    photo=models.CharField(max_length=500)
    name=models.CharField(max_length=100)
    description=models.CharField(max_length=100)
    price=models.CharField(max_length=100)
    VENDOR=models.ForeignKey(Vendor,on_delete=models.CASCADE)



class Feedback(models.Model):
    user=models.ForeignKey(User,on_delete=models.CASCADE)
    date=models.DateField(max_length=100)
    feedbacks=models.CharField(max_length=100)
    PRODUCT=models.ForeignKey(Product,on_delete=models.CASCADE)


class Product_request(models.Model):
    product=models.ForeignKey(Product,on_delete=models.CASCADE)
    userid=models.ForeignKey(User,on_delete=models.CASCADE)
    date_and_time=models.DateField()
    status=models.CharField(max_length=100,default="pending")

class Calender(models.Model):
    date=models.DateField(max_length=100)
    time=models.CharField(max_length=100)
    month=models.CharField(max_length=100)
    year=models.CharField(max_length=100)
class Exercise_plans(models.Model):
    calender=models.ForeignKey(Calender,on_delete=models.CASCADE)
    userid=models.ForeignKey(User,on_delete=models.CASCADE)
    workout_plans=models.CharField(max_length=100)

class Addinstruction(models.Model):
    inst=models.CharField(max_length=500)
    photo = models.CharField(max_length=500)
    date=models.DateField(max_length=100)


class Event(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    user = models.IntegerField(default=1)



    @property
    def get_html_url(self):
        url = reverse('cal:event_edit', args=(self.id,))
        return "<a href="+url+"> "+self.title+' </a>'