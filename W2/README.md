### Sinatra 기초

ruby 버전은 나중을 위해서 `2.3.3`으로 설치한다.

#### 필수 gem list

sinatra gem 을 반드시 설치한다.

`$ gem install sinatra`

~~선택)이면서~~ 필수 서버를 껐다가 켜지 않더라도 변경사항이 반영된다.

`$ gem install sinatra-reloader`

#### Sinatra 파일구조
- app.rb

- views/
  - .erb


#### Sinatra 기초 코드

아래의 코드는 **반드시** 상단에 입력을 한다.
```Ruby
# app.rb
require 'sinatra'
require 'sinatra/reloader'

# parameter가 서버로 넘어오는 형태를 볼 수 있다.
# git bash 창에서 확인
before do
  p "><><><><><><><><><><><><>"
  p params
  p "><><><><><><><><><><><><>"
end
```
위의 코드를 삽입하면, `git bash` 창에서 아래와 같이 확인 가능하다.
> /vote 페이지에서 투표한 결과를 form 을 통해 /result 페이지로 넘기는 과정

```
::1 - - [13/Dec/2017:09:25:11 +0900] "GET /result?count=2 HTTP/1.1" 200 51 0
::1 - - [13/Dec/2017:09:25:11 대한민국 표준시] "GET /result?count=2 HTTP/1.1
http://localhost:4567/vote -> /result?count=2
"****************************************"
{"count"=>"2", "captures"=>[]}
"****************************************"

```
#### 서버 실행 및 환경

아래의 화면이 보이면 성공적으로 서버가 돌아가고 있는 것이다.
`http://localhost:4567`을 통해 웹 화면을 확인할 수 있다.
```
$ ruby app.rb
[2017-12-13 09:24:54] INFO  WEBrick 1.3.1
[2017-12-13 09:24:54] INFO  ruby 2.3.3 (2016-11-21) [x64-mingw32]
== Sinatra (v2.0.0) has taken the stage on 4567 for development with backup
[2017-12-13 09:24:54] INFO  WEBrick::HTTPServer#start: pid=1464 port=4567
```

#### 라우터와 페이지 만들기

항상 페이지를 만들 때에는 해당하는 라우터 예) `/welcome`를 만들고 해당 하는 페이지(`welcome.erb`)를 만들어야 한다.

> erb 파일은 반드시 views 폴더 내에 만들자.

```Ruby
get '/welcome' do #라우터와
  erb :welcome #해당 라우터에 들어오면 무슨 화면을 보여줄 지 정해야한다.
end
```
~~`send_file`은 머리 속에서 지워두자. 루비 코드를 활용한 웹 사이트들을 만들테니까!~~

#### url을 통해 정보 받기
> @변수는 ~~ruby에서 인스턴스 변수지만~~ 우선 `erb`에서 사용하기 위한 변수라고 생각해도 무관하다! 도장 꽝!

> params 해쉬는 위에 sinatra 기초코드 부분을 확인하자!

```Ruby
# app.rb
get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
```
```html
<!--views/welcome.erb-->
<%= @name %>!! 안녕!!!
```

#### form 데이터를 활용하기

# 여기부터는 여러분이!
