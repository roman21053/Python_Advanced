from django.contrib import admin
from .models import MenuItem, SliderItem, Order, OrderItems, Discount

# Register your models here.

admin.site.register(MenuItem)
admin.site.register(SliderItem)


class OrderAdmin(admin.ModelAdmin):
    list_display = fields = ['id', 'first_name', "last_name", "address", "email"]

    def queryset(self,request):
        qs = super(Order, self).queryset(request)
        return qs.all()


admin.site.register(Order, OrderAdmin)
admin.site.register(Discount)
