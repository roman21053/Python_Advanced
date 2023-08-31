# Generated by Django 4.2.1 on 2023-08-07 13:17

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0003_product_date_of_addition'),
    ]

    operations = [
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('discount', models.CharField(max_length=255)),
                ('date_of_creation', models.DateField(default=datetime.date.today)),
                ('date_of_use', models.DateField(blank=True, null=True)),
            ],
        ),
    ]
