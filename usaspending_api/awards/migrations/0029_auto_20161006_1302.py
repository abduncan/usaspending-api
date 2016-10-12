# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2016-10-06 17:02
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('awards', '0028_auto_20161006_1049'),
    ]

    operations = [
        migrations.AlterField(
            model_name='financialassistanceaward',
            name='award',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='awards.Award'),
        ),
        migrations.AlterField(
            model_name='procurement',
            name='award',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='awards.Award'),
        ),
    ]
