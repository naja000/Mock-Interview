# Generated by Django 3.2.12 on 2023-09-22 17:18

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('mock', '0009_vac_qn'),
    ]

    operations = [
        migrations.CreateModel(
            name='answer_details',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ans', models.CharField(max_length=200)),
                ('emot', models.CharField(max_length=200)),
                ('date', models.DateField()),
                ('oans', models.CharField(max_length=200)),
                ('USER', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mock.user')),
                ('VAC_QN', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='mock.vac_qn')),
            ],
        ),
    ]
