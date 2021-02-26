from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import Movie
import redis
import re
import datetime

Pool = redis.ConnectionPool(host='127.0.0.1', port=6379, db=0, decode_responses=True)
conn = redis.Redis(connection_pool=Pool, decode_responses=True)


class Index(ListView):  # 首页视图
    template_name = 'index.html'
    model = Movie

    def get_context_data(self, *, object_list=None, **kwargs):  # 首页展示的各个类型的电影
        context = super(Index, self).get_context_data()
        context['hentai'] = Movie.objects.filter(type='h')[:5]
        context['kehuan'] = Movie.objects.filter(type='ke')[:5]
        context['xiju'] = Movie.objects.filter(type='xi')[:5]
        context['love'] = Movie.objects.filter(type='a')[:5]
        context['dongzuo'] = Movie.objects.filter(type='d')[:5]
        return context


class Moviedetail(DetailView):  # 详情视图
    template_name = 'detail.html'
    model = Movie
    context_object_name = 'movie'
    slug_field = 'id'

    def dispatch(self, request, *args, **kwargs):
        path = request.get_full_path()
        id = re.search(r'\d+', path).group()
        history(request, id)  # 记录浏览历史
        return super(Moviedetail, self).dispatch(request, *args, **kwargs)


class Sort(ListView):  # 分类视图
    template_name = 'sort.html'
    context_object_name = 'sorts'
    paginate_by = 21

    def get_queryset(self):  # 筛选所需要的电影类型
        s = self.kwargs['slug'].split('-')
        if s[0] == 'q':  # 判断是不是全部类型
            if s[1] == '0':
                return Movie.objects.all()
            return Movie.objects.filter(area=s[1])
        elif s[1] == '0':  # 判断是不是全部类型
            return Movie.objects.filter(type=s[0])
        return Movie.objects.filter(type=s[0], area=s[1])


def history(request, movie_id):
    user_agent = request.headers['user-agent']
    time_now = datetime.datetime.now().replace(microsecond=0)
    if conn.llen(user_agent) > 50:  # 最多缓存50次浏览历史
        conn.rpop(user_agent)
    conn.lpush(user_agent, movie_id + '--' + str(time_now))
    conn.expire(user_agent, 60 * 30)  # 这里控制浏览历史缓存多长时间


def get_history(request):
    user_agent = request.headers['user-agent']
    l = conn.lrange(user_agent, 0, -1)
    s = {}
    for i in l:
        h = i.split('--')
        m = Movie.objects.get(id=int(h[0]))
        s[h[1]] = m
    return render(request, 'history.html', {'movies': s})
