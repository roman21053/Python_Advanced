# Generated by Django 4.2.1 on 2023-08-10 14:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0007_alter_discount_discount'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Discount',
        ),
    ]
