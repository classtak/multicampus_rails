require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'
# 가상환경에서 localhost 사용하기 위한 설정
set :bind, '0.0.0.0'

# DataMapper를 사용하는데, db 파일을 현재 경로에 blog.db라고 저장하겠다.
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")
# Post라는 클래스를 만들고, db(table)을 만든다.
# 머리에 엑셀을 띄어놓으세요..!
class Post
  include DataMapper::Resource
  # (자동)id는 고유한 값이고, 저장할 수록 1부터 하나씩 증가한다.
  property :id, Serial
  # title은 String 타입이다. 길이는 50
  property :title, String
  # content는 Text 타입이다. String보다 많이 긴 문자열
  property :content, Text
  # (자동)날짜시간을 저장한다.
  property :created_at, DateTime
end

# model(데이터베이스) 설정이 끝났다!
DataMapper.finalize

# 설정이 끝났으니까, table을 만들어줘! (엑셀 테이블이 뿅!)
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

get '/destroy/:id' do
  @post = Post.get(params[:id])
  # 해당하는 데이터를 지워줘!
  @post.destroy
  redirect '/'
end

get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
