from django.urls import path
from .views import category_page, product_page

urlpatterns = [
    path("/<slug>", category_page, name="category_page"),
    path("/<slug>/<title>", product_page, name="product_page"),
]
