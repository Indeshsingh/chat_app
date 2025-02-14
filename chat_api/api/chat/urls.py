# from django.urls import path
# from . import views

# urlpatterns = [
#     path('chatrooms/', views.ChatRoomList.as_view(), name='chatroom-list'),
#     path('chatrooms/<int:pk>/', views.ChatRoomDetail.as_view(), name='chatroom-detail'),
#     path('chatrooms/<int:room_id>/messages/', views.MessageList.as_view(), name='message-list'),
#     path('messages/<int:message_id>/replies/', views.ReplyList.as_view(), name='reply-list'),
#     path('contacts/', views.ContactList.as_view(), name='contact-list'),
# ]

from django.urls import path
from .views import SendOTPView, VerifyOTPView, RegisterUserView, SearchUserView

urlpatterns = [
    path('send-otp/', SendOTPView.as_view(), name='send_otp'),
    path('verify-otp/', VerifyOTPView.as_view(), name='verify_otp'),
    path('register/<int:user_id>/', RegisterUserView.as_view(), name='register_user'),
    path('search/', SearchUserView.as_view(), name='search_user'),
]

