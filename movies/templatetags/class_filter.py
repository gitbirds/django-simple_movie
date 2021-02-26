from django import template

register = template.Library()


@register.filter
def hanzi(value):
    return value[1]


@register.filter
def strfort(value):
    return str(value)
