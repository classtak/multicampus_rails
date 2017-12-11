## 2주차 정리 내용

#### Ruby 꼭 읽어야하는 자료!
* [코드에는 스타일가이드가 있다. ruby 편]
* [Ruby String]
* [Ruby Array]
* [Ruby Hash]

#### sinatra
[sinatra 공식 홈페이지 - 한국어](http://sinatrarb.com/intro-ko.html)

###### sinatra 시작하기

`$ gem install sinatra`

```Ruby
# app.rb
require 'sinatra'
get '/' do
  'hello world!!!'
end
```

##### 파일을 보여주는 두가지 방식
1. `erb` : embeded ruby
**index.erb는 반드시 `views` 폴더에 넣어줘야한다.**
```Ruby
# app.rb
# app.rb가 있는 폴더 내에 views라는 폴더를 만들고
# 그 안에 index.erb를 만들어 놓는다!!!!
require 'sinatra'
get '/' do
  erb :index
end
```

2. `send_file`
**app.rb랑 같은 곳에 있는 있는 파일**
```Ruby
#app.rb
require 'sinatra'
get '/' do
  send_file "index.html"
end
```

##### 사용자로부터 파라미터 받는 법.
1. url을 통해 받기
```ruby
#app.rb
require 'sinatra'
get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
```

```html
<!-- welcome.erb -->
<!Doctype HTML>
<html>
  <head>
    <title> 후후후 </title>
  </head>
  <body>
    <h1> 반가워!!!!! #{@name}</h1>
  </body>
</html>
```

2. `form` 데이터 받기
```HTML
<!-- google.erb -->
<form action="/search">
  검색어 <input type="text" name="q">
  <input type="submit" value="얍!">
</form>
```

```Ruby
# app.rb
require 'sinatra'
get '/search' do
  @q = params[:q]
  erb :search
end
```

```html
<!-- search.erb -->
<%= @q %> 검색했지!
```

[코드에는 스타일가이드가 있다. ruby 편]: https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md
[Ruby String]: https://ruby-doc.org/core-2.3.3/String.html
[Ruby Array]: https://ruby-doc.org/core-2.3.3/Array.html
[Ruby Hash]: https://ruby-doc.org/core-2.3.3/Array.html

