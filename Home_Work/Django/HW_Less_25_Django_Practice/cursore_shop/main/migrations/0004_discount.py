# Generated by Django 4.2.1 on 2023-08-10 14:36

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0003_order_orderitems'),
    ]

    operations = [
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('discount_cod', models.CharField(max_length=255)),
                ('discount', models.IntegerField(default=5)),
                ('date_of_creation', models.DateField(default=datetime.date.today)),
                ('date_of_use', models.DateField(blank=True, null=True)),
            ],
        ),
    ]
