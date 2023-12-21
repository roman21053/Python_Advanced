from rest_framework import serializers
from products.models import Product, Category


class ProductSerializer(serializers.HyperlinkedModelSerializer):

    class Meta:
        model = Product
        fields = ["id", "title", "description", "price", "discount_price"]


class CategorySerializer(serializers.HyperlinkedModelSerializer):
    products = ProductSerializer(read_only=True, many=True)

    class Meta:
        model = Category
        fields = ["id", "title", "slug", "products"]


class SessionSerializer(serializers.Serializer):
    cart = serializers.ListField(child=serializers.DictField(child=serializers.IntegerField()))
    discount_cod = serializers.CharField(max_length=255, required=False, allow_blank=True)
