from rest_framework import generics
from .models import ChatRoom, Message, Contact
from .serializers import ChatRoomSerializer, MessageSerializer, ContactSerializer,ReplySerializer

class ChatRoomList(generics.ListCreateAPIView):
    queryset = ChatRoom.objects.all()
    serializer_class = ChatRoomSerializer

class ChatRoomDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = ChatRoom.objects.all()
    serializer_class = ChatRoomSerializer

class MessageList(generics.ListCreateAPIView):
    serializer_class = MessageSerializer

    def get_queryset(self):
        room_id = self.kwargs['room_id']
        return Message.objects.filter(room_id=room_id)
    
class ReplyList(generics.ListCreateAPIView):
    serializer_class = ReplySerializer

    def get_queryset(self):
        message_id = self.kwargs['message_id']
        return Reply.objects.filter(message_id=message_id)

class ContactList(generics.ListAPIView):
    queryset = Contact.objects.all()
    serializer_class = ContactSerializer