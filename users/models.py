from django.db import models
from movies.models import Movie
from django.contrib.auth.models import User


# Create your models here.
class Comments(models.Model):  # 影评模型
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, verbose_name='电影')
    user = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='用户')
    time = models.DateTimeField(auto_now_add=True, verbose_name='增加时间')
    comment = models.TextField(verbose_name='评论')

    class Meta:
        verbose_name = '影评'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.comment


class user_link(models.Model):  # 用户头像管理
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    touxiang = models.ImageField(upload_to='touxiang', default='touxiang/default.jpg', verbose_name='头像')
    collections = models.CharField(max_length=400, null=True)
