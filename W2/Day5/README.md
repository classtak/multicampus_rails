### sinatra CRUD 기초


#### irb 혹은 pry 창에서 Model 확인하는 법

```console
$ irb
irb(main):001:0>require './app.rb'
=>true
```

#### 기본조작

`.all`, `.get(id)`

```console
irb(main):002:0> Post.all
=> [#<Post @id=9 @title="수정되는거맞냐" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:18:24+00:00 ((2458103j,15504s,0n),+0s,2299161j)>>, #<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>]
irb(main):003:0> Post.all.length
=> 2
irb(main):004:0> Post.all.class
=> DataMapper::Collection
irb(main):005:0> Post.get(9)
=> #<Post @id=9 @title="수정되는거맞냐" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:18:24+00:00 ((2458103j,15504s,0n),+0s,2299161j)>>
irb(main):006:0> Post.get(9).title
=> "수정되는거맞냐"
irb(main):007:0> Post.get(9).id
=> 9
irb(main):008:0> Post.first(:title => "수정")
=> #<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>
```

#### Create

`Post.create(:컬럼명1 => "내용", :컬럼명2 => "내용")`

위의 코드는 아래의 코드와 같다.

```ruby
  post = Post.new
  post.title = "제목입니다."
  post.content = "내용이지롱"
  post.save
```

```console
irb(main):002:0> Post.create(:title => "제목이냐", :content => "내용이다.")
=> #<Post @id=11 @title="제목이냐" @content="내용이다." @created_at=#<DateTime: 2017-12-15T05:56:36+00:00 ((2458103j,21396s,233720457n),+0s,2299161j)>>
```

#### Read

`Post.get(id값)`

```console
irb(main):005:0> Post.get(9)
=> #<Post @id=9 @title="수정되는거맞냐" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:18:24+00:00 ((2458103j,15504s,0n),+0s,2299161j)>>
```

#### Destroy

`Post.get(id값).destroy`

> destroy는 하나의 데이터를 찾아서(get) 삭제한다. Create/Read는 table 자체의 접근(Post)

```console
irb(main):002:0> Post.all
=> [#<Post @id=9 @title="수정되는거맞냐" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:18:24+00:00 ((2458103j,15504s,0n),+0s,2299161j)>>, #<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>]
irb(main):009:0> Post.get(9).destroy
=> true
irb(main):010:0> Post.all
=> [#<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>]
```

#### Update

`Post.get(id값).update(:컬럼명1 => "내용", :컬럼명2 => "내용")`

> update는 하나의 데이터를 찾아서(get) 삭제한다. Create/Read는 table 자체의 접근(Post)

```console
irb(main):013:0> Post.all
=> [#<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>]
irb(main):015:0> Post.get(10).update(:title => "수정했습니다.")
=> true
irb(main):014:0> Post.get(10)
=> #<Post @id=10 @title="수정했습니다." @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>
irb(main):017:0> irb(main):014:0> Post.all
```

#### 찾기

`Post.first(:컬럼명 => "내용")`

> 특정 컬럼에서 특정한 내용을 가진 첫번째 것을 가져온다.

```console
irb(main):011:0> Post.first(:title => "수정")
=> #<Post @id=10 @title="수정" @content=<not loaded> @created_at=#<DateTime: 2017-12-15T04:28:13+00:00 ((2458103j,16093s,0n),+0s,2299161j)>>
```


#### rails 설치 코드

```console
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
```

```console
gem install rails -v 4.2.9
```

```console
rbenv rehash
```

```console
rails -v
# Rails 4.2.9
```
