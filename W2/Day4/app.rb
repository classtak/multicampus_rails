require 'sinatra'
require 'sinatra/reloader'
# 가상환경에서 쓰이는 것
set :bind, '0.0.0.0'
before do
  p "*********************************"
  p params
  p "*********************************"
end

get '/' do
  erb :index
end

# form
get '/post' do
  erb :post
end
# 결과 보여주는 곳
get '/complete' do
  @title = params[:title]
  @content = params[:content]
  erb :complete
end
