from django.urls import path
from .views import Index, Moviedetail, Sort, get_history
from haystack.views import SearchView

urlpatterns = [
    path('', Index.as_view(), name='index'),
    path('detail/<int:pk>', Moviedetail.as_view(), name='detail'),
    path('sort/<slug:slug>/', Sort.as_view(), name='sort'),
    path('get_history', get_history, name='history'),
    path('search', SearchView(), name='search')

]
