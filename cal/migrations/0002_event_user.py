# Generated by Django 3.2.20 on 2023-11-18 11:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cal', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='user',
            field=models.IntegerField(default=1),
        ),
    ]
