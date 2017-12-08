# gem을 사용하기 위해 불러온다.
# 원하는 정보를 가져오기 위한 nokogiri
require 'nokogiri'
# httparty에서 https를 요청할 수 없어서 사용하는 Gem
# git bash 에서 gem install rest-client 해주세요!
require 'rest-client'

# 1.실시간 검색어 링크
url = "https://datalab.naver.com/keyword/realtimeList.naver"
# 2. url을 통해서 요청한다.
response = RestClient.get(url)
# 3. 가져온 문서를 nokogiri 형식으로 저장한다. for 컴퓨터
doc = Nokogiri::HTML(response)
# 4. 문서에서 xpath를 활용하여서 가져온다! (실시간검색어 20개)
realtime = doc.xpath("//*[@id='content']/div[3]/div/div/div[4]/div/div/ul/li")
# 5. realtime에 저장된 것 중에서 태그 안에 있는 텍스트를 출력한다.
realtime.each do |x|
  puts x.text.gsub(' ','').strip
end
