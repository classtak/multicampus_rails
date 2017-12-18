class HomeController < ApplicationController
  # 컨트롤러는 액션의 모음이다.
  # 모델과 뷰 사이의 중간관리자이다.
  # action
  # app/views/컨트롤러이름/액션이름.html.erb
  # app/views/home/index.html.erb
  def index
  end
  # action
  # app/views/home/lotto.html.erb
  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num]
  end

  def lunch
    @lunch = ["멀캠20층", "순남시래기", "명동칼국수"].sample
    url = {
    "멀캠20층" => "https://scontent-sea1-1.cdninstagram.com/t51.2885-15/s480x480/e35/20987024_1431422050287339_2004189507347283968_n.jpg?ig_cache_key=MTU4NzUwMTg2NjEwNzc3MTI0Nw%3D%3D.2",
    "순남시래기" => "http://cfile21.uf.tistory.com/image/2110194F561E2E7B309541",
    "명동칼국수" => "http://cfile21.uf.tistory.com/image/2427F53C52FFA6CC37703E"
  }
    @lunch_url = url[@lunch]
  end

  def google
  end

  def vote
  end

  def result
    @vote = params[:vote]
  end

  def random
  end

  def rc
    @name = params[:username]
    @var1 = ["행복한", "사랑스러운", "열정가득한"].sample
    @var2 = ["바보", "멍청이", "천재"].sample
  end
end
