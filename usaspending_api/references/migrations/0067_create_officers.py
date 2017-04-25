# -*- coding: utf-8 -*-
# Generated by Django 1.10.1 on 2017-04-13 17:41
from __future__ import unicode_literals

from django.db import migrations


def update_legal_entities(apps, schema_editor):
    LegalEntity = apps.get_model("references", "LegalEntity")
    LegalEntityOfficers = apps.get_model("references", "LegalEntityOfficers")

    les = LegalEntity.objects.filter(officers__isnull=True)

    for le in les:
        LegalEntityOfficers.objects.create(legal_entity=le)


def degrade_legal_entities(apps, schema_editor):
    LegalEntity = apps.get_model("references", "LegalEntity")

    LegalEntity.objects.filter(officers__isnull=False).update(officers=None)


class Migration(migrations.Migration):

    dependencies = [
        ('references', '0066_legalentityofficers'),
    ]

    operations = [
        migrations.RunPython(update_legal_entities, reverse_code=degrade_legal_entities)
    ]