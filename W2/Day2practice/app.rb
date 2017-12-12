require 'sinatra'
require 'sinatra/reloader'
require 'rest-client'
require 'nokogiri'

get '/' do
  erb :index
end

get '/insta' do
  require 'rest-client'
  require 'nokogiri'
  @username = params[:username]
  url = "http://www.pictame.com/user/#{@username}/1176668818/1461756945785769000_1176668818"
  response = RestClient.get(url)
  doc = Nokogiri::HTML(response.body)
  imgs = doc.css("img")
  @image_urls = []
  imgs.each do |img|
    @image_urls << img.attr('src') if img.attr('src').include? 'instagram'
  end
  erb :insta
end
