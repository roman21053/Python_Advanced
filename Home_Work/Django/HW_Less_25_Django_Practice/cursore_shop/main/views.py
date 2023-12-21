from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth import login, authenticate, logout
from .models import SliderItem, Order, OrderItems, Discount
from products.models import Product
from .forms import NewUserForm


# Create your views here.
def main(request):
    slider_items = SliderItem.objects.all()
    products = Product.objects.filter(show_on_main_page=True)
    return render(request,'index.html', {"slider_items": slider_items, "products": products})


def add_to_cart(request, product_id: int):
    product_obj = Product.objects.get(id=product_id)
    is_product_already_exist = False
    if not request.session.get("cart"):
        request.session["cart"] = []
    else:
        for product in request.session.get("cart", []):
            if product_id == product["id"]:
                product["quantity"] = product["quantity"] + 1
                product["price"] = product_obj.price * product["quantity"]
                is_product_already_exist = True
    print(request.session.get("cart"))
    if not is_product_already_exist:
        request.session["cart"].append({"id": product_id, "quantity": 1, "price": product_obj.price})
    request.session.modified = True
    print(request.session.get("cart"))
    return HttpResponseRedirect("/")


def cart(request):
    cart_products = []
    entered_discount = request.GET.get("code_entered")

    if entered_discount:
        if entered_discount==("discount_restart"):
            cart_discount = Discount.objects.all()
            for elem in cart_discount:
                elem.date_of_use = None
                elem.save()
            if ("discount_cod") in request.session:
                del request.session["discount_cod"]
                request.session.modified = True
        else:
            if Discount.objects.filter(discount_cod=entered_discount):
                cart_discount = Discount.objects.filter(discount_cod=entered_discount).first()
                if cart_discount.date_of_use is None:
                    cart_discount.activate_discount()    # notes in the database that the code has been used
                    cart_discount.save()
                    request.session["discount_cod"] = entered_discount
                    request.session.modified = True
                else:
                    message = "This code has already been used"
                    return render(request, "message.html", {"message": message})
            else:
                message = "This code is invalid"
                return render(request, "message.html", {"message": message})

    for cart_item in request.session.get("cart", []):
        product = Product.objects.get(id=cart_item["id"])
        product.quantity = cart_item["quantity"]
        if request.session.get("discount_cod"):
            cart_discount = Discount.objects.filter(discount_cod=request.session["discount_cod"]).first()
            product.total_price = cart_item["price"] * (1 - (cart_discount.discount_percent * 0.01))
        else:
            product.total_price = cart_item["price"]
        cart_products.append(product)

    return render(request, "cart.html", {"cart_products": cart_products})


def checkout(request):
    total_price = 0
    for cart_item in request.session.get("cart", []):
        total_price = total_price + cart_item["price"]

    return render(request, "checkout.html", {"total_price": total_price})


def show_message(request):
    return render(request, "message.html")


def checkout_proceed(request):
    if request.method == "POST":
        order = Order()
        order.first_name = request.POST.get("first_name")
        order.last_name = request.POST.get("last_name")
        order.email = request.POST.get("email")
        order.address = request.POST.get("address")
        order.address2 = request.POST.get("address2")
        order.country = request.POST.get("country")
        order.city = request.POST.get("city")
        order.postcode = request.POST.get("postcode")
        total = 0
        for item in request.session.get("cart", []):
            total = total + item["price"]
        order.total_price = total
        order.save()
        for item in request.session.get("cart", []):
            order_item = OrderItems()
            order_item.product_id = item["id"]
            order_item.order_id = order.id
            order_item.price = item["price"]
            order_item.quantity = item["quantity"]
            order_item.save()
    return HttpResponseRedirect("/")


def register(request):
    if request.method == "POST":
        form = NewUserForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return HttpResponseRedirect("/")
    form = NewUserForm()
    return render(request, "sign-up.html", {"form": form})


def sign_in(request):
    if request.method == "POST":
        user = authenticate(username=request.POST.get("username"), password=request.POST.get("password"))
        if user:
            login(request, user)
        return HttpResponseRedirect('/')
    return render(request, "sign-in.html")


def sign_out(request):
    logout(request)
    return HttpResponseRedirect("/")


def view_session_keys(request):
    session_keys = {key: request.session[key] for key in request.session.keys()}
    return render(request, 'session_keys.html', {'session_keys': session_keys})