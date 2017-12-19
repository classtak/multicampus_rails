class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    # form에서 글쓰는 창이니까, 아무것도 없다.
  end

  def create
    # params[:username]  params[:title] params[:content]
    # 1번 방법
    Post.create(:username => params[:username],
              :title => params[:title],
              :content => params[:content])
    # 1-1번 방법
    # Post.create(username: params[:username],
    #           title: params[:title],
    #           content: params[:content])
    # 2번 방법
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save

    redirect_to '/'
  end
end
