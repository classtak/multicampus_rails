require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
require './model.rb'
# 가상환경에서 localhost 사용하기 위한 설정
set :bind, '0.0.0.0'

before do
  p params
end

# 게시글을 다 보여주는 곳
get '/' do
  @posts = Post.all
  erb :index
end

# 게시글을 입력할 수 있는 곳
get '/new' do #어제의 /post
  erb :new
end

# 게시글을 만드는 곳 (db에 저장하는 곳)
# CRUD - 'C' : Create
get '/create' do #어제의 /complete
  # form에서 params hash가 넘어온다.
  # input/textarea에 **name**으로 설정된 것.
  # p params
  # => {"title" => 유저가 입력한 것, "content" => 유저가 입력한 것}
  @title_erb = params[:title]
  @content_erb = params[:content]
  # db에 저장하자!
  # title, content는 맨 위에 DataMapper에 설정한 내용.
  # Post라는 table(db)의 column(열)에 해당하는 것.
  Post.create(:title => @title_erb, :content => @content_erb)
  # erb :create
  redirect '/'
end

# variable routing : 주소를 통해 변수를 받는 것.
# CRUD - 'R' ; Read
get '/posts/:id' do
  # Post.get(id) ; id가 일치하는 데이터를 가지고 온다.
  @post = Post.get(params[:id])
  erb :posts
end

# CRUD - 'D' ; destroy
get '/destroy/:id' do
  post = Post.get(params[:id])
  # 해당하는 데이터를 지워줘!
  post.destroy
  redirect '/'
end

# CRUD - 'U'
# 1. 사용자에게 form을 입력받는 창
get '/edit/:id' do
  @post = Post.get(params[:id])
  erb :edit
end

# 2. 실제로 db에 저장
get '/update/:id' do
  post = Post.get(params[:id])
  post.update(:title =>
    params[:title],
  :content => params[:content])
  redirect '/'
end

get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
