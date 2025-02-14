# from rest_framework import generics
# from .models import ChatRoom, Message, Contact
# from .serializers import ChatRoomSerializer, MessageSerializer, ContactSerializer,ReplySerializer

# class ChatRoomList(generics.ListCreateAPIView):
#     queryset = ChatRoom.objects.all()
#     serializer_class = ChatRoomSerializer

# class ChatRoomDetail(generics.RetrieveUpdateDestroyAPIView):
#     queryset = ChatRoom.objects.all()
#     serializer_class = ChatRoomSerializer

# class MessageList(generics.ListCreateAPIView):
#     serializer_class = MessageSerializer

#     def get_queryset(self):
#         room_id = self.kwargs['room_id']
#         return Message.objects.filter(room_id=room_id)
    
# class ReplyList(generics.ListCreateAPIView):
#     serializer_class = ReplySerializer

#     def get_queryset(self):
#         message_id = self.kwargs['message_id']
#         return Reply.objects.filter(message_id=message_id)

# class ContactList(generics.ListAPIView):
#     queryset = Contact.objects.all()
#     serializer_class = ContactSerializer
import random
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from .serializers import *

class RegisterView(APIView):
    def post(self, request):
        serializer = RegisterSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response({'message': 'User registered successfully'}, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class SearchUserView(APIView):
    def get(self, request):
        phone_number = request.query_params.get('phone_number')
        if not phone_number:
            return Response({'error': 'Phone number is required'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            user = CustomUser.objects.get(phone_number=phone_number)
            serializer = UserSearchSerializer(user)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except CustomUser.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)


class SendMessageView(APIView):
    def post(self, request):
        sender_id = request.data.get('sender_id')
        receiver_id = request.data.get('receiver_id')
        content = request.data.get('content')

        if not sender_id or not receiver_id or not content:
            return Response({'error': 'Missing required fields'}, status=status.HTTP_400_BAD_REQUEST)

        sender = CustomUser.objects.get(id=sender_id)
        receiver = CustomUser.objects.get(id=receiver_id)

        # Find an existing chat room or create a new one
        chat_room, created = ChatRoom.objects.get_or_create(
            name=f'chat_{min(sender_id, receiver_id)}_{max(sender_id, receiver_id)}'
        )
        chat_room.participants.add(sender, receiver)

        # Save message
        message = Message.objects.create(room=chat_room, sender=sender, content=content)

        return Response({'message': 'Message sent successfully'}, status=status.HTTP_201_CREATED)
    

    class GetMessagesView(APIView):
      def get(self, request, room_id):
        try:
            chat_room = ChatRoom.objects.get(id=room_id)
            messages = chat_room.messages.all().order_by('timestamp')
            serializer = MessageSerializer(messages, many=True)
            return Response(serializer.data, status=status.HTTP_200_OK)
        except ChatRoom.DoesNotExist:
            return Response({'error': 'Chat room not found'}, status=status.HTTP_404_NOT_FOUND)
        

    import random
from django.conf import settings
from twilio.rest import Client
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from .models import ChatRoom, CustomUser
from .serializers import SendOTPSerializer, VerifyOTPSerializer

class SendOTPView(APIView):
    def post(self, request):
        serializer = SendOTPSerializer(data=request.data)
        if serializer.is_valid():
            phone_number = serializer.validated_data['phone_number']
            otp = str(random.randint(100000, 999999))

            user, created = CustomUser.objects.get_or_create(phone_number=phone_number)
            user.otp = otp
            user.save()

            # Send OTP via Twilio
            client = Client(settings.TWILIO_ACCOUNT_SID, settings.TWILIO_AUTH_TOKEN)
            message = client.messages.create(
                body=f"Your OTP is {otp}",
                from_=settings.TWILIO_PHONE_NUMBER,
                to=phone_number
            )

            return Response({'message': 'OTP sent successfully'}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    




class VerifyOTPView(APIView):
    def post(self, request):
        serializer = VerifyOTPSerializer(data=request.data)
        if serializer.is_valid():
            phone_number = serializer.validated_data['phone_number']
            otp = serializer.validated_data['otp']

            try:
                user = CustomUser.objects.get(phone_number=phone_number)
                if user.otp == otp:
                    user.is_verified = True
                    user.save()
                    return Response({'message': 'OTP verified successfully', 'user_id': user.id}, status=status.HTTP_200_OK)
                return Response({'error': 'Invalid OTP'}, status=status.HTTP_400_BAD_REQUEST)
            except CustomUser.DoesNotExist:
                return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class RegisterUserView(APIView):
    def post(self, request, user_id):
        try:
            user = CustomUser.objects.get(id=user_id, is_verified=True)
            serializer = RegisterUserSerializer(user, data=request.data, partial=True)

            if serializer.is_valid():
                serializer.save()
                return Response({'message': 'User registered successfully'}, status=status.HTTP_200_OK)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

        except CustomUser.DoesNotExist:
            return Response({'error': 'User not found'}, status=status.HTTP_404_NOT_FOUND)

class SearchUserView(APIView):
    def get(self, request):
        query = request.query_params.get('query')

        if not query:
            return Response({'error': 'Search query is required'}, status=status.HTTP_400_BAD_REQUEST)

        users = CustomUser.objects.filter(
            phone_number__icontains=query
        ) | CustomUser.objects.filter(
            first_name__icontains=query
        ) | CustomUser.objects.filter(
            last_name__icontains=query
        )

        serializer = RegisterUserSerializer(users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

