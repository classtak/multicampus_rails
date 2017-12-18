def hello
  puts "안녕!"
  yield
  puts "잘가!"
end

hello {puts "멀티캠퍼스야!"}
