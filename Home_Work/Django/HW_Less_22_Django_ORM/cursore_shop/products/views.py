from django.shortcuts import render
from .models import Category, Product


def category_page(request, slug):
    category = Category.objects.get(slug=slug)
    return render(request, "category.html", {"category": category, "products": category.products.all()})


def product_page(request, slug, title):
    category = Category.objects.get(slug=slug)
    product = Product.objects.get(title=title)
    return render(request, "products.html", {"category": category, "products": category.products.all(), "product": product})
