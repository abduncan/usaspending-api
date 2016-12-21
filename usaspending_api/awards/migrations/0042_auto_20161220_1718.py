# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-12-20 17:18
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('awards', '0041_auto_20161219_1358'),
    ]

    operations = [
        migrations.AlterField(
            model_name='financialaccountsbyawards',
            name='award',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='financial_set', to='awards.Award'),
        ),
    ]
