# Generated by Django 4.0.1 on 2023-11-14 09:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0005_feedback_product_product_vendor'),
    ]

    operations = [
        migrations.AlterField(
            model_name='product_request',
            name='status',
            field=models.CharField(default='pending', max_length=100),
        ),
    ]
