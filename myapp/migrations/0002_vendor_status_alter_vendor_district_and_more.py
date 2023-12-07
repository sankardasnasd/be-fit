# Generated by Django 4.0.1 on 2023-11-03 05:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='vendor',
            name='status',
            field=models.CharField(default='', max_length=10),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='district',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='email',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='gender',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='name',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='phone',
            field=models.BigIntegerField(default='', max_length=10),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='photo',
            field=models.CharField(default='', max_length=500),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='pin',
            field=models.CharField(default='', max_length=100),
        ),
        migrations.AlterField(
            model_name='vendor',
            name='place',
            field=models.CharField(default='', max_length=100),
        ),
    ]