from django.urls import path
from .views import main, add_to_cart, cart, checkout, checkout_proceed, register, sign_in, sign_out, view_session_keys, show_message

urlpatterns = [
    path('', main),
    path("add-to-cart/<int:product_id>", add_to_cart, name="add_to_cart"),
    path("cart", cart, name="cart"),
    path("checkout", checkout, name="checkout"),
    path("checkout/proceed", checkout_proceed, name="checkout_proceed"),
    path("sign-up", register, name="sign-up"),
    path("sign-in", sign_in, name="sign-in"),
    path("sign-out", sign_out, name="sign-out"),
    path("session_keys", view_session_keys, name="session_keys"),
    path("message", show_message, name="message")
]