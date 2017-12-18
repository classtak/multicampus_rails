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
    @lunch = ["20층", "이자까야", "김밥카페"].sample
  end
end
