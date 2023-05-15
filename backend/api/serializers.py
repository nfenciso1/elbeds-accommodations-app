from rest_framework import serializers
from .models import *
from rest_framework.validators import ValidationError
from rest_framework.authtoken.models import Token
import re


class SignUpSerializer(serializers.ModelSerializer):
    email = serializers.CharField(max_length=80)
    password = serializers.CharField(min_length=8, write_only=True)
    first_name = serializers.CharField(max_length=100)
    last_name = serializers.CharField(max_length=100)
    middle_initial = serializers.CharField(max_length=1, required=False)
    suffix = serializers.CharField(max_length=10, required=False)
    phone_no = serializers.CharField(max_length=15)
    username=serializers.CharField(max_length=45)
    verified = serializers.BooleanField(default=False)
    id_type = serializers.CharField(max_length=50, required=False)
    id_picture = serializers.URLField(required=False)
    id_number = serializers.CharField(max_length=50, required=False)
    archived = serializers.BooleanField(default=False)
    tickets = serializers.JSONField(default=list)
    type = serializers.CharField(max_length=50)
    accommodations = serializers.JSONField(default=list)

    class Meta:
        model = User
        fields = ["email", "username", "password","first_name","last_name","middle_initial","suffix","phone_no","verified","id_type","id_picture","id_number", "archived", "tickets", "type", "accommodations"]

    def validate(self, attrs):
        email = attrs["email"]
        username = attrs["username"]
        password = attrs["password"]
        email_pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        password_pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$'

        if not re.match(email_pattern, email):
             raise ValidationError("Invalid email format!")
        
        for i in User.objects.filter(type="user"):
            if i.email == email:
                 raise ValidationError("Email has already been used")
            if i.username == username:
                 raise ValidationError("Username has already been used")
        
        if len(password) < 8:
            raise ValidationError("length of password must be more than 8 letters!")
    
        if not re.match(password_pattern, password):
            raise ValidationError("Password must contain at least one uppercase letter, one lowercase letter, and one digit!")
        if not password.isalnum():
            raise ValidationError("Password must not contain spaces or other special characters!")


        return super().validate(attrs)

    def create(self, validated_data):
        password = validated_data.pop("password")

        user = super().create(validated_data)

        user.set_password(password)

        user.save()

        Token.objects.create(user=user)

        return user

class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

class ticketSerializer(serializers.ModelSerializer):
    class Meta:
        model = Ticket
        fields = '__all__'

# class accommodationSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Accommodation
#         fields = '__all__'

class reviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = '__all__'

class ObjectIdField(serializers.Field):
    def to_representation(self, value):
        return str(value)

class AccommodationSerializer(serializers.ModelSerializer):
    #id = ObjectIdField(read_only=True)

    class Meta:
        model = Accommodation
        #fields = ('id', 'name', 'description', 'location', 'price_per_night', 'max_guests', 'date_created', 'date_updated')
        fields = '__all__'
        
