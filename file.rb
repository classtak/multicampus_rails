# 0. file.rb 의 위치는 rubyclass 폴더 안에 있다.

# 1. text 폴더로 들어간다.
Dir.chdir("text")

# 2. 파일을 열어서 내용을 입력한다.
20.times do |i|
  i+=1
  File.open("newfile#{i}.txt",  "w+") do |file|
    file.write("hello world!")
  end
end
