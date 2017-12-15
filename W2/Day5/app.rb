require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
# 가상환경에서 localhost 사용하기 위한 설정
set :bind, '0.0.0.0'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
DataMapper.finalize

# automatically create the post table
Post.auto_upgrade!
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
