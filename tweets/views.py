from django.shortcuts import render, redirect
from .models import Tweet
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

def home(request):
    tweets = Tweet.objects.all()
    return render(request, 'tweets/home.html', {'tweets': tweets})

@login_required
def create_tweet(request):
    if request.method == 'POST':
        content = request.POST.get('content')
        tweet = Tweet.objects.create(user=request.user, content=content)
        return redirect('home')
    return render(request, 'tweets/create_tweet.html')
