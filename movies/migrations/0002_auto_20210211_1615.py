# Generated by Django 3.1.6 on 2021-02-11 08:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('movies', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='movie',
            name='show_time',
            field=models.TimeField(verbose_name='上映时间'),
        ),
    ]