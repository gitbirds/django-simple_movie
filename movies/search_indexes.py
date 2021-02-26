from haystack import indexes
from .models import Movie
# 暂时只对电影的标题进行了全文检索，后续还可以加入对演员，类型等检索
class MovieIndex(indexes.SearchIndex,indexes.Indexable):
    text = indexes.CharField(document=True, use_template=True)
    def get_model(self):
        return Movie
    def index_queryset(self, using=None):
        return self.get_model().objects.all()