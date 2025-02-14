# from rest_framework import serializers
# from .models import Message, ChatRoom,Contact,Reply

# class MessageSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Message
#         fields = ['id', 'room', 'sender', 'content', 'timestamp']

# class ReplySerializer(serializers.ModelSerializer):
#     sender = serializers.StringRelatedField()

#     class Meta:
#         model = Reply
#         fields = ['id', 'message', 'sender', 'content', 'timestamp']

# class ChatRoomSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = ChatRoom
#         fields = ['id', 'name', 'participants', 'created_at']

# class ContactSerializer(serializers.ModelSerializer):
#     user = serializers.StringRelatedField()

#     class Meta:
#         model = Contact
#         fields = ['id', 'user', 'profile_picture', 'last_seen']

from rest_framework import serializers
from .models import *

class RegisterSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['username', 'phone_number', 'password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        return CustomUser.objects.create_user(
            username=validated_data['username'],
            phone_number=validated_data['phone_number'],
            password=validated_data['password'],
        )
class UserSearchSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'username', 'phone_number']

class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ['id', 'room', 'sender', 'content', 'timestamp']

class SendOTPSerializer(serializers.Serializer):
    phone_number = serializers.CharField()

class VerifyOTPSerializer(serializers.Serializer):
    phone_number = serializers.CharField()
    otp = serializers.CharField()


class RegisterUserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id', 'first_name', 'last_name']


