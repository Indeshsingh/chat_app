from rest_framework import serializers
from .models import Message, ChatRoom,Contact,Reply

class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ['id', 'room', 'sender', 'content', 'timestamp']

class ReplySerializer(serializers.ModelSerializer):
    sender = serializers.StringRelatedField()

    class Meta:
        model = Reply
        fields = ['id', 'message', 'sender', 'content', 'timestamp']

class ChatRoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChatRoom
        fields = ['id', 'name', 'participants', 'created_at']

class ContactSerializer(serializers.ModelSerializer):
    user = serializers.StringRelatedField()

    class Meta:
        model = Contact
        fields = ['id', 'user', 'profile_picture', 'last_seen']