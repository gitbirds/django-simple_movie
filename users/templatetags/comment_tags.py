from django  import template
from django.contrib.auth.models import User
register=template.Library()
from ..models import Comments

@register.simple_tag
def get_comment(movie_id):
    return Comments.objects.filter(movie_id=movie_id)

@register.simple_tag
def get_user(user_id):
    return User.objects.get(id=user_id)