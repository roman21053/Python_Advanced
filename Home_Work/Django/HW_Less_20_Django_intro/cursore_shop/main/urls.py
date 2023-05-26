from django.urls import path
from .views import main, mall

urlpatterns = [
    path('', main),
    path('ho', mall),
]
