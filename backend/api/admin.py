from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(User)
admin.site.register(Admin)
admin.site.register(Review)
admin.site.register(Ticket)
admin.site.register(Establishment)
admin.site.register(Room)