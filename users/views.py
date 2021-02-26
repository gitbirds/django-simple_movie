from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .models import Comments, user_link
from django.contrib.auth.models import User
from django.contrib import messages
from movies.models import Movie
import re


def logins(request):
    if request.method == 'GET':
        context = {
            'login': AuthenticationForm,
            'register': UserCreationForm
        }
        return render(request, 'login.html', context)
    u = AuthenticationForm(data=request.POST)
    if u.is_valid():
        username = u.cleaned_data['username']
        password = u.cleaned_data['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')
        else:
            messages.error(request, '用户名或密码错误')
            return redirect('login')
    else:
        messages.error(request, '用户名或密码错误')
        return redirect('login')


def Register(reuqest):
    # 注册视图写的潦草，用的django自带的注册表单。我想现在的网站一般不会用用户名登录的方法，
    # 要么手机号登录，要么QQ，微信第三方登录，邮箱登录都很少了。使用第三方接口，申请需要一定的条件，
    # 因此没办法写一个第三方登录
    u = UserCreationForm(reuqest.POST)
    if u.is_valid():
        u.save()
        user = User.objects.get(username=u.cleaned_data['username'])
        user_link.objects.create(user_id=user.id)
        messages.info(reuqest, '创建成功，请登录')
        return redirect('login')
    messages.error(reuqest, '表单错误，请从新输入。请更换用户名或者确定两次密码是否一致')
    return redirect('login')


def Logout(request):
    logout(request)
    return redirect('index')


@login_required(login_url='login')
def comment(request):  # 评论视图
    user_id = request.POST['user_id']
    movie_id = request.POST['movie_id']
    comment = request.POST['comment']
    Comments.objects.create(comment=comment, user_id=user_id, movie_id=movie_id)
    return redirect('detail/%d' % int(movie_id))  # 因为模板没有用ajax方法进行评论，所以重定向到视图，这里会导致浏览历史加1


@login_required(login_url='login')
def collect(request, id):
    u = User.objects.get(id=request.user.id)
    try:  # 用户刚创建时，收藏表为空，空类型不可迭代，if语句会报错，用try消除报错
        '''用户的收藏字段我用的普通的char字段，这个字段不能存入列表只能存入字符串，因此存入
        电影模型id时要转化为字符串，并加上逗号隔开'''
        id = str(id)
        if id in u.user_link.collections:  # if后面执行取消收藏操作
            ic = id + ','
            u.user_link.collections = u.user_link.collections.replace(ic, '')
            u.user_link.save()
            return redirect('detail', int(id))
        else:  # else后面执行收藏操作
            ic = id + ','
            u.user_link.collections += ic
            u.user_link.save()
            return redirect('detail', int(id))
    except:
        ic = str(id) + ','
        u.user_link.collections = ic
        u.user_link.save()
        return redirect('detail', id)


def user_collect(request):
    c = request.user.user_link.collections
    ll = []
    if c:
        l = re.findall(r'\d+', c)  # 用正则把所有收藏匹配出来
        for i in l:
            try:
                c = Movie.objects.get(id=i)  # 当某个电影被删除，模型get不到就会报错，用try消除然后继续循环
                ll.append(c)
            except:
                i = str(i) + ','
                u = User.objects.get(id=request.user.id)
                u.user_link.collections = u.user_link.collections.replace(i, '')  # 这里当捕获到错误后顺便把电影从用户收藏列表中去除
                u.user_link.save()
        return render(request, 'collections.html', {'collect': ll})
    return render(request, 'collections.html', {'collect': ll})
