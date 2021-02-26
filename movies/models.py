from django.db import models


# Create your models here.
class Movie(models.Model):
    AREA = ((0, '全部'), (1, '大陆'), (2, '香港'), (3, '中国台湾'), (4, '美国'),
            (5, '韩国'), (6, '日本'), (7, '欧洲'), (8, '法国'), (9, '印度'), (10, '泰国'),
            (11, '英国'))
    TYPE = (('q', '全部'), ('h', '动漫'), ('ke', '科幻'), ('xi', '喜剧'), ('a', '爱情'),
            ('d', '动作'), ('z', '战争'), ('x', '悬疑'), ('k', '恐怖'), ('w', '文艺'), ('o', '其他'))
    title = models.CharField(max_length=20, verbose_name='电影名字')
    actors = models.CharField(max_length=100, verbose_name='主要演员')
    show_time = models.DateField(verbose_name='上映时间')
    director = models.CharField(max_length=20, verbose_name='导演')
    type = models.CharField(max_length=30, choices=TYPE, verbose_name='类型')
    content = models.TextField(verbose_name='简介')
    area = models.IntegerField(choices=AREA, verbose_name='地区')
    image = models.ImageField(upload_to='media', verbose_name='封面')

    def __str__(self):
        return self.title

    class Meta:
        verbose_name = '电影'
        verbose_name_plural = verbose_name
