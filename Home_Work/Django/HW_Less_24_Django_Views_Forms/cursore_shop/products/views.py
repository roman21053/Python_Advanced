from django.shortcuts import render
from .models import Category, Product


def product_page(request, slug, title):
    category = Category.objects.get(slug=slug)
    product = Product.objects.get(title=title)
    return render(request, "products.html", {"category": category, "product": product})


def category_page(request, slug):
    category = Category.objects.get(slug=slug)
    sort_by = request.GET.get('sort_by')  # Отримати параметр сортування з запиту
    products = category.products.all()

    if sort_by == 'price_low_to_high':
        products = products.order_by('price')
    elif sort_by == 'price_high_to_low':
        products = products.order_by('-price')
    elif sort_by == 'date_low_to_high':
        products = products.order_by('date_of_addition')
    elif sort_by == 'date_high_to_low':
        products = products.order_by('-date_of_addition')

    return render(request, "category.html", {"category": category, "products": products})