from django import template

register = template.Library()
from ..models import Movie


@register.simple_tag
def get_area():  # 返回筛选区域
    return Movie.AREA


@register.simple_tag
def get_type():  # 返回筛选类型
    return Movie.TYPE


@register.simple_tag
def get_url(request, arg):  # 这里主要是多类型筛选使用，对url后面的参数进行重组
    url = request.get_full_path()
    l = url.split('/')[2].split('-')  # 获得后面的参数列表，列如：url：/sort/q-0-0，参数【‘q'，’0‘，’0‘】
    if isinstance(arg, str):  # 更换电影类型参数
        l[0] = arg
    elif arg < 12:  # 更换电影区域参数
        l[1] = str(arg)
    else:
        l[2] = str(arg)  # 更换电影时间参数  --电影时间，我前端没有写
    return l[0] + '-' + l[1] + '-' + l[2]  # 组合参数


@register.simple_tag
def get_current_url(request):  # 这个是获取当前url参数，给选项加背景色使用，因为我没有使用js，所以就用if判断句，在sort.html中
    url = request.get_full_path()
    return url.split('/')[2].split('-')
