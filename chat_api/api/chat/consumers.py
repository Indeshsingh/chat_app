# import json
# from channels.generic.websocket import AsyncWebsocketConsumer
# from .models import ChatRoom, Message, Reply
# from django.contrib.auth.models import User

# class ChatConsumer(AsyncWebsocketConsumer):
#     async def connect(self):
#         self.room_name = self.scope['url_route']['kwargs']['room_name']
#         self.room_group_name = f'chat_{self.room_name}'

#         # Join room group
#         await self.channel_layer.group_add(
#             self.room_group_name,
#             self.channel_name
#         )
#         await self.accept()

#     async def disconnect(self, close_code):
#         # Leave room group
#         await self.channel_layer.group_discard(
#             self.room_group_name,
#             self.channel_name
#         )

#     # Receive message from WebSocket
#     async def receive(self, text_data):
#         text_data_json = json.loads(text_data)
#         message_type = text_data_json['type']
#         sender_id = text_data_json['sender_id']
#         content = text_data_json['content']

#         sender = await User.objects.aget(id=sender_id)
#         room = await ChatRoom.objects.aget(name=self.room_name)

#         if message_type == 'message':
#             # Save message to database
#             message = await Message.objects.acreate(
#                 room=room,
#                 sender=sender,
#                 content=content
#             )
#             # Broadcast message to room group
#             await self.channel_layer.group_send(
#                 self.room_group_name,
#                 {
#                     'type': 'chat_message',
#                     'message_id': message.id,
#                     'sender': sender.username,
#                     'content': content,
#                     'timestamp': message.timestamp.isoformat(),
#                 }
#             )
#         elif message_type == 'reply':
#             parent_message_id = text_data_json['parent_message_id']
#             parent_message = await Message.objects.aget(id=parent_message_id)
#             # Save reply to database
#             reply = await Reply.objects.acreate(
#                 message=parent_message,
#                 sender=sender,
#                 content=content
#             )
#             # Broadcast reply to room group
#             await self.channel_layer.group_send(
#                 self.room_group_name,
#                 {
#                     'type': 'chat_reply',
#                     'reply_id': reply.id,
#                     'sender': sender.username,
#                     'content': content,
#                     'parent_message_id': parent_message_id,
#                     'timestamp': reply.timestamp.isoformat(),
#                 }
#             )

#     # Receive message from room group
#     async def chat_message(self, event):
#         await self.send(text_data=json.dumps({
#             'type': 'message',
#             'message_id': event['message_id'],
#             'sender': event['sender'],
#             'content': event['content'],
#             'timestamp': event['timestamp'],
#         }))

#     # Receive reply from room group
#     async def chat_reply(self, event):
#         await self.send(text_data=json.dumps({
#             'type': 'reply',
#             'reply_id': event['reply_id'],
#             'sender': event['sender'],
#             'content': event['content'],
#             'parent_message_id': event['parent_message_id'],
#             'timestamp': event['timestamp'],
#         }))

import json
from channels.generic.websocket import AsyncWebsocketConsumer
from django.contrib.auth import get_user_model
from .models import Message, ChatRoom

User = get_user_model()

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = f'chat_{self.room_name}'

        # Add user to the WebSocket group
        await self.channel_layer.group_add(self.room_group_name, self.channel_name)
        await self.accept()

    async def disconnect(self, close_code):
        # Remove user from the WebSocket group
        await self.channel_layer.group_discard(self.room_group_name, self.channel_name)

    async def receive(self, text_data):
        data = json.loads(text_data)
        sender_id = data['sender_id']
        content = data['content']

        sender = await User.objects.aget(id=sender_id)
        chat_room = await ChatRoom.objects.aget(name=self.room_name)

        # Save the message to the database
        message = await Message.objects.acreate(room=chat_room, sender=sender, content=content)

        # Send message to room group
        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': content,
                'sender': sender.username,
                'timestamp': str(message.timestamp)
            }
        )

    async def chat_message(self, event):
        await self.send(text_data=json.dumps({
            'message': event['message'],
            'sender': event['sender'],
            'timestamp': event['timestamp']
        }))
