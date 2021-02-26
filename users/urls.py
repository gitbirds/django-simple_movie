from django.urls import path
from .views import logins, Register, comment, Logout, collect, user_collect

urlpatterns = [
    path('login', logins, name='login'),
    path('register', Register, name='register'),
    path('out', Logout, name='out'),
    path('comment', comment, name='comment'),
    path('collect/<int:id>', collect, name='collect'),
    path('user_collect', user_collect, name='uc'),
]
