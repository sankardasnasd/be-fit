from django.db import models
from django.urls import reverse

class Event(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    user = models.IntegerField(default=1)
    status=models.CharField(max_length=50,default='Pending')



    @property
    def get_html_url(self):
        url = reverse('cal:event_edit', args=(self.id,))
        return "<a href="+url+"> "+self.title+"-"+self.status +' </a>'
