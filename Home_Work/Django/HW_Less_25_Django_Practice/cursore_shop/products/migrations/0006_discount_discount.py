# Generated by Django 4.2.1 on 2023-08-08 05:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0005_rename_discount_discount_discount_cod'),
    ]

    operations = [
        migrations.AddField(
            model_name='discount',
            name='discount',
            field=models.IntegerField(default=5),
            preserve_default=False,
        ),
    ]
