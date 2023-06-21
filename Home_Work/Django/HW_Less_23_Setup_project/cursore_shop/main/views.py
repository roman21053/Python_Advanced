from django.shortcuts import render
from .models import MenuItem, SliderItem
from products.models import Product, Category


# Create your views here.
def main(request):
    menu_items = MenuItem.objects.all()
    slider_items = SliderItem.objects.all()
    products = Product.objects.filter(show_on_main_page=True)
    categories = Category.objects.filter(parent_id=None)
    return render(request,'index.html', {"menu_items": menu_items, "slider_items": slider_items, "products": products, "categories": categories})
