# Generated by Django 5.0.6 on 2024-06-12 01:08

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('subir_archivo_e_imagen', '0004_subirdocumento_delete_subirdumentoimagen'),
    ]

    operations = [
        migrations.AlterModelTable(
            name='subirdocumento',
            table='files',
        ),
    ]
